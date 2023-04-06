//
//  UserDefaults+Extension.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 06/04/2023.
//

import Foundation

extension UserDefaults{
    private enum UserDefaultsKeys: String {
        case hanOnBoarding
    }
    var hasOnBoarded: Bool{
        get{
            bool(forKey: UserDefaultsKeys.hanOnBoarding.rawValue)
        }
        set{
            setValue(newValue, forKeyPath: UserDefaultsKeys.hanOnBoarding.rawValue)
        }
    }
    
}
