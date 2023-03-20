//
//  CategoryCollectionViewCell.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 20/03/2023.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImg: UIImageView!
    
    @IBOutlet weak var categoryTitleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUp(category: DishCategory){
        categoryTitleLbl.text = category.name
        categoryImg.kf.setImage(with: category.image.asUrl)
    }
}


