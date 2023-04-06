//
//  AuthCollectionViewCell.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 04/04/2023.
//

import UIKit

class AuthCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var passwordImg: UIImageView!
    @IBOutlet weak var actionBtn: UIButton!
    
    @IBOutlet weak var slideBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setSignInCell(){
        
        actionBtn.setTitle("Login", for: .normal)
        slideBtn.setTitle("Sign Up", for: .normal)
    }
    func setSignUpCell(){
        actionBtn.setTitle("Sign Up", for: .normal)
        slideBtn.setTitle("Sign In", for: .normal)
    }

}
