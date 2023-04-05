//
//  Order.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 22/03/2023.
//

import Foundation

struct Order:Decodable{
    var id: String?
    var name: String?
    var dish: Dish?
    
}
