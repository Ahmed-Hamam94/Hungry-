//
//  EndPoint.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 22/03/2023.
//

import Foundation

enum EndPoint{
    static let baseUrl = "https://yummie.glitch.me"
   
    case allCategories
    case placeOrder(String)
    case categoryDishes(String)
    case fetchOrders
    
    var path: String{
        switch self{
        case .allCategories:
            return "/dish-categories"
        case .placeOrder(let dishId):
            return "/orders/\(dishId)"
        case .categoryDishes(let categoryId):
            return "/dishes/\(categoryId)"
        case .fetchOrders:
            return "/orders"
            
        }
        
        
    }
    
}
