//
//  String+extension.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 20/03/2023.
//

import Foundation

extension String{
    var asUrl : URL?{
        return URL(string: self)
    }
}
