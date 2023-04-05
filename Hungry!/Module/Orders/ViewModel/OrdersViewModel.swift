//
//  OrdersViewModel.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 22/03/2023.
//

import Foundation


protocol OrdersProtocol {
    func callFuncToDishes(completionHandler:@escaping (Bool) -> Void)
}

class OredersViewModel:OrdersProtocol{
    
    var orders: [Order]?
    var service : OrdersProvider?
     var bindingOrders : (()->()) = {}
    
    init(){
        service = NetworkManager()
    }
    
    func callFuncToDishes(completionHandler:@escaping (Bool) -> Void){
        service?.getOrders(completion: {[weak self]  result in
            completionHandler(false)
                switch result {
                    
                case .success(let orders):
                    self?.orders = orders
                    self?.bindingOrders()
                case .failure(let error):
                    print(error.localizedDescription)
                }
                completionHandler(true)
        })
    }

    
}

