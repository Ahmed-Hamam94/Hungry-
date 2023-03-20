//
//  OnBoardingCollectionViewCell.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 19/03/2023.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var slideImageView: UIImageView!
    
    @IBOutlet weak var slideTitleLbl: UILabel!
    
    @IBOutlet weak var SlideDescriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(_ slide: onBoardingSlide){
        self.slideImageView.image = slide.image
        self.slideTitleLbl.text = slide.title
        self.SlideDescriptionLbl.text = slide.description
    }
}
