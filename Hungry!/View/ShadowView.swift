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
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        cornerRadius = 10
    }
}
