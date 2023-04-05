//
//  NetworkManager.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 22/03/2023.
//

import Foundation

protocol CategoryProvider{
    func getCategories( completion: @escaping(Result<AllDishes,APIError>) -> Void)
    
}
protocol OrderProvider{
    func placeOrder(dishId: String, name: String, completion: @escaping(Result<Order, APIError>) -> Void)
}
protocol CategoryDishesProvider{
    func getCategoryDishes(categoryId: String, completion: @escaping(Result<[Dish], APIError>) -> Void)
}
protocol OrdersProvider{
    func getOrders(completion: @escaping(Result<[Order], APIError>) -> Void)
}

class NetworkManager: CategoryProvider,OrderProvider,CategoryDishesProvider,OrdersProvider{
    
    func getCategories( completion: @escaping(Result<AllDishes,APIError>) -> Void){
        request(endPoint: .allCategories, method: .Get, completion: completion)

    }
    
    func placeOrder(dishId: String, name: String, completion: @escaping(Result<Order, APIError>) -> Void) {
        let params = ["name": name]
        
        request(endPoint: .placeOrder(dishId), method: .Post, parameters: params, completion: completion)
    }
    
    func getCategoryDishes(categoryId: String, completion: @escaping(Result<[Dish], APIError>) -> Void){
        request(endPoint: .categoryDishes(categoryId), method: .Get, completion: completion)
    }
    
    func getOrders(completion: @escaping(Result<[Order], APIError>) -> Void){
        request(endPoint: .fetchOrders, method: .Get, completion: completion)
    }

    
    
    private func createRequest(endPoint: EndPoint,method: Methods,parameter: [String:Any]? = nil) -> URLRequest?{
        
        let url = EndPoint.baseUrl + endPoint.path
        guard let urll = url.asUrl else{return nil}
        var urlRequest = URLRequest(url: urll)
        let headers = ["Content-Type": "application/json"]
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpMethod = "\(method)"
        
        if let parameter = parameter {
            switch method {
            case .Get:
                var urlComponent = URLComponents(string: url)
                urlComponent?.queryItems = parameter.map { URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
            case .Post, .Delete, .Patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: parameter, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
        
    }
    
    private func request<T: Decodable>(endPoint: EndPoint,method: Methods,parameters: [String: Any]? = nil,completion: @escaping(Result<T, APIError>) -> Void) {
        guard let request = createRequest(endPoint: endPoint, method: method,parameter: parameters) else {
            completion(.failure(APIError.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
                print("The response is:\n\(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("The error is: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    ///
    private func handleResponse<T: Decodable>(result: Result<Data, Error>?,
                                              completion: (Result<T, APIError>) -> Void) {
        guard let result = result else {
            completion(.failure(APIError.unknownError))
            return
        }
        
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                print(data)
                completion(.failure(APIError.errorDecoding))
                return
            }
            
            if let error = response.error {
                completion(.failure(APIError.serverError))
                return
            }
            
            if let decodedData = response.data {
                print(decodedData)
                completion(.success(decodedData))
            } else {
                completion(.failure(APIError.unknownError))
            }
        case .failure(let error):
            completion(.failure(error as! APIError))
        }
    }
    
    
}


