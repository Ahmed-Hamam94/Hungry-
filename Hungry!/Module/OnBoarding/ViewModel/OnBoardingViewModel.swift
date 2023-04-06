//
//  OnBoardingViewModel.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 19/03/2023.
//

import Foundation

class OnBoardingViewModel{
    var bindingonBoardingSlide : (()->()) = {}
    var comingData : [onBoardingSlide]?
    
    init(){
        comingData = [
            onBoardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "food")),
            onBoardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "chef")),
            
       ]
    }
    
    
}
