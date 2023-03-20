//
//  HomeViewModel.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 20/03/2023.
//

import Foundation

class HomeViewModel{
    
    var categories : [DishCategory]?
    var popularDishes : [Dish]?
    var chefSpecials : [Dish]?
    
    init(){
         categories = [DishCategory(name: "1gfxfgfxfx", image: "https://picsum.photos/100/200"), DishCategory(name: "1", image: "https://picsum.photos/100/200"), DishCategory(name: "1gcgcccgcgcgcgcgcgch h", image: "https://picsum.photos/100/200"), DishCategory(name: "1", image: "https://picsum.photos/100/200"), DishCategory(name: "1", image: "https://picsum.photos/100/200")]
        popularDishes = [Dish(id: "1",name: "dish",description: "sweet and sweet nansebfbefbe",image: "https://picsum.photos/100/200",calories: 321.0352572462),Dish(id: "1",name: "dish",description: "sweet and sweet nansebfbefbe",image: "https://picsum.photos/100/200",calories: 321.0352572462),Dish(id: "1",name: "dish",description: "sweet and sweet nansebfbefbe",image: "https://picsum.photos/100/200",calories: 321.0352572462),Dish(id: "1",name: "dish",description: "sweet and sweet nansebfbefbe",image: "https://picsum.photos/100/200",calories: 321.0352572462),Dish(id: "1",name: "dish",description: "sweet and sweet nansebfbefbe",image: "https://picsum.photos/100/200",calories: 321.0352572462)]
        
        chefSpecials = [Dish(id: "1",name: "special",description: "sweet and sweet nansebfbefbe",image: "https://picsum.photos/100/200",calories: 321.0352572462),Dish(id: "1",name: "dish",description: "ssadfvdaweet and sweet nansebfbefbe",image: "https://picsum.photos/100/200",calories: 321.0352572462),Dish(id: "1",name: "dish",description: "sweet and sweet nansebfbefbe",image: "https://picsum.photos/100/200",calories: 321.0352572462),Dish(id: "1",name: "dish",description: "sweet and sweet nansebfbefbe",image: "https://picsum.photos/100/200",calories: 321.0352572462),Dish(id: "1",name: "dish",description: "sweet and sweet nansebfbefbe",image: "https://picsum.photos/100/200",calories: 321.0352572462)]
    }
   
}
