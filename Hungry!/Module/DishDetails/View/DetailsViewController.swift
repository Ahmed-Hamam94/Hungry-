//
//  DetailsViewController.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 21/03/2023.
//

import UIKit
import Kingfisher
import KRProgressHUD
class DetailsViewController: UIViewController {
    @IBOutlet weak var dishImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var orderTextField: UITextField!
    var detailsViewModel : DetailsViewModel?
    
    var dish : Dish!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsViewModel = DetailsViewModel(dish: dish)
        updateUI()
        checkUser()
    }
    
    private func checkUser(){
        if UserManager.logedUser == nil{
            orderTextField.isHidden = true
        }
    }
    
    private func updateUI(){
        dishImg.kf.setImage(with: detailsViewModel?.dish?.image?.asUrl)
        titleLbl.text = detailsViewModel?.dish?.name
        caloriesLbl.text = detailsViewModel?.dish?.formatedCalories
        descriptionLbl.text = detailsViewModel?.dish?.description
       
    }
    
    private func detailsIsFinished(name: String){
        detailsViewModel?.callFuncToOrder(name: name, completionHandler: { (isFinished) in
            if !isFinished {
                KRProgressHUD.show(withMessage: "Your order has been received. 👨🏼‍🍳")
            }else {
                KRProgressHUD.dismiss()
            }
        })
    }
    
    @IBAction func orderButton(_ sender: Any) {
        
        
        if UserManager.logedUser == nil {
            AlertMsg.displayError(message: "Login first", vc: self)
        }else{
            guard let name = orderTextField.text?.trimmingCharacters(in: .whitespaces),
                  !name.isEmpty else {
                KRProgressHUD.showError(withMessage: "Please enter your name")
                return
            }
            KRProgressHUD.show(withMessage: "Placing Order...")
            
            detailsIsFinished(name: name)
        }
        
        
        
    }
}
