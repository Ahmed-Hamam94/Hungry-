//
//  PopularCollectionViewCell.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 20/03/2023.
//

import UIKit
import Kingfisher

class PopularCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var disheImg: UIImageView!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var discriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUp(dish: Dish){
        titleLabel.text = dish.name
        disheImg.kf.setImage(with: dish.image?.asUrl)
        caloriesLabel.text = dish.formatedCalories
        discriptionLabel.text = dish.description
    }
}
