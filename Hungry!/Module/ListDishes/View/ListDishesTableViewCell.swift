//
//  ListDishesTableViewCell.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 21/03/2023.
//

import UIKit

class ListDishesTableViewCell: UITableViewCell {
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUp(dish: Dish){
        titleLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        descriptionLabel.text = dish.description
    }
    func setUpOrder(order: Order){
        titleLabel.text = order.dish?.name
        descriptionLabel.text = order.name
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
    }
}
