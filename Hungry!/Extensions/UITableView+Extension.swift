//
//  UITableView+Extension.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 22/03/2023.
//

import UIKit
extension UITableView {
    
    func registerCelNib<cell: UITableViewCell>(cellClass: cell.Type){
        self.register(UINib(nibName: String(describing: cell.self), bundle: nil), forCellReuseIdentifier: String(describing: cell.self))
    }
  
   
   
}
