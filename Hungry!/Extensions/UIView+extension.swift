//
//  UIView+extension.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 19/03/2023.
//

import UIKit

extension UIView{
   @IBInspectable var cornerRadius : CGFloat {
       get{return self.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
