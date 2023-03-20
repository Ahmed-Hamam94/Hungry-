//
//  Dish.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 20/03/2023.
//

import Foundation

struct Dish{
    var id: String?
    var name: String?
    var description: String?
    var image: String?
    var calories: Double?
    
    var formatedCalories: String{
        return(String(format: "%.2f calories", calories ?? 0))
    }
}
