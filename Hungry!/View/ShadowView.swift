//
//  ShadowView.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 20/03/2023.
//

import UIKit

class ShadowView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeShadow()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeShadow()
    }
    
    private func makeShadow(){
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10
        cornerRadius = 10
    }
}
