//
//  HomeViewModel.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 20/03/2023.
//

import Foundation

protocol CategoryProtocol {
    func callFuncToGetCategories(completionHandler:@escaping (Bool) -> Void)
    
}

class HomeViewModel: CategoryProtocol{
    
    
    var allDishes: AllDishes?
    var categories : [DishCategory]?
    var popularDishes : [Dish]?
    var chefSpecials : [Dish]?
    var service : CategoryProvider?
    var bindingCategories : (()->()) = {}
    
    
    init(){
        service = NetworkManager()
    }
    
    
    func callFuncToGetCategories(completionHandler: @escaping (Bool) -> Void) {
        completionHandler(false)
        service?.getCategories { [weak self] result in
            switch result {
                
            case .success(let allDishes):
                self?.categories = allDishes.categories
                self?.popularDishes = allDishes.populars
                self?.chefSpecials = allDishes.specials
                self?.bindingCategories()
            case .failure(let error):
                print(error.localizedDescription)
            }
            completionHandler(true)
        }
    }
    
    
}
