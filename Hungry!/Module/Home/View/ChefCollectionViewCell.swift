//
//  ChefCollectionViewCell.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 20/03/2023.
//

import UIKit

class ChefCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUp(dish: Dish){
        titleLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLabel.text = dish.formatedCalories
        descriptionLabel.text = dish.description
    }
}
