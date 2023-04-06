//
//  AlertMsg.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 05/04/2023.
//

import Foundation
import UIKit

class AlertMsg{
    
   static func displayError(message: String, vc: UIViewController){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
    
   
    
}
