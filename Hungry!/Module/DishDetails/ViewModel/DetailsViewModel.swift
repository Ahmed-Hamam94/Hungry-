//
//  DetailsViewModel.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 21/03/2023.
//

import Foundation

protocol OrderProtocol {
    func callFuncToOrder(name: String,completionHandler:@escaping (Bool) -> Void)
}

class DetailsViewModel:OrderProtocol {
    var dish : Dish?
    var service : OrderProvider?
     var bindingCategories : (()->()) = {}
    
    init(dish:Dish){
        service = NetworkManager()
        self.dish = dish
    }
    
    func callFuncToOrder(name: String,completionHandler: @escaping (Bool) -> Void) {
        completionHandler(false)
        service?.placeOrder(dishId: dish?.id ?? "1", name: name, completion: { result in
            switch result {
                
            case .success(_): break

             
            case .failure(let error):
                print(error.localizedDescription)
            }
            completionHandler(true)
        })
    }
}
