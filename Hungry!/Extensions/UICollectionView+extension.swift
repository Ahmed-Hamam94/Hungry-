//
//  UICollectionView+extension.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 20/03/2023.
//

import UIKit
extension UICollectionView {
    
    func registerCelNib<cell: UICollectionViewCell>(cellClass: cell.Type){
        self.register(UINib(nibName: String(describing: cell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: cell.self))
    }
  
}
