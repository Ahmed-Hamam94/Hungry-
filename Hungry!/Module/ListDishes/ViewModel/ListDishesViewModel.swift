//
//  ListDishesViewModel.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 21/03/2023.
//

import Foundation

protocol DishesProtocol {
    func callFuncToDishes(completionHandler:@escaping (Bool) -> Void)
}

class ListDishesViewModel:DishesProtocol{
    var category : DishCategory?
    var dishes: [Dish]?
    var service : CategoryDishesProvider?
     var bindingCategories : (()->()) = {}
    
    init(category: DishCategory){
        service = NetworkManager()
        self.category = category
    }
    func callFuncToDishes(completionHandler: @escaping (Bool) -> Void) {
        completionHandler(false)
        service?.getCategoryDishes(categoryId:category?.id ?? "id?" , completion: { [weak self] result in
            switch result {
                
            case .success(let catDishes):
                self?.dishes = catDishes
                self?.bindingCategories()
            case .failure(let error):
                print(error.localizedDescription)
            }
            completionHandler(true)
        })
        
        
        
        
        
    }
}
