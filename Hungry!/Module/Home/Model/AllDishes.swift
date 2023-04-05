//
//  AllDishes.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 31/03/2023.
//

import Foundation

struct AllDishes: Decodable{
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
