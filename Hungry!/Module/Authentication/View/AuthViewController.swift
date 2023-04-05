//
//  AuthViewController.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 04/04/2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class AuthViewController: UIViewController {
    @IBOutlet weak var logImage: UIImageView!
    
    @IBOutlet weak var signCollectionView: UICollectionView!
    
    var authViewModel : AuthViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
authViewModel = AuthViewModel(db: Firestore.firestore())
        setUpCollection()
    }
    
    private func setUpCollection(){
        signCollectionView.delegate = self
        signCollectionView.dataSource = self
        signCollectionView.registerCelNib(cellClass: AuthCollectionViewCell.self)
    }
   

}

extension AuthViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthCollectionViewCell", for: indexPath) as? AuthCollectionViewCell else {fatalError()}
        if indexPath.row == 0 { // sign in
            cell.setSignInCell()
            cell.actionBtn.addTarget(self, action: #selector(logInPressed(_ :)), for: .touchUpInside)
            cell.slideBtn.addTarget(self, action: #selector(goSignUp(_ :)), for: .touchUpInside)
        }else{    // sign up
            cell.setSignUpCell()
            cell.actionBtn.addTarget(self, action: #selector(signUpPressed(_ :)), for: .touchUpInside)
            cell.slideBtn.addTarget(self, action: #selector(goLogIn(_ :)), for: .touchUpInside)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    @objc func goSignUp(_ sender: UIButton){
        let indexPath = IndexPath(row: 1, section: 0)
        self.signCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    @objc func goLogIn(_ sender: UIButton){
        let indexPath = IndexPath(row: 0, section: 0)
        self.signCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc func logInPressed(_ sender: UIButton){
        let indexPath = IndexPath(row: 0, section: 0)
        guard let cell = self.signCollectionView.cellForItem(at: indexPath) as? AuthCollectionViewCell, let email = cell.emailTxt.text, let password = cell.passwordTxt.text else {return}
        if email.isEmpty == true || password.isEmpty == true {
            AlertMsg.displayError(message: "Please Enter Empty Fields", vc: self)
        }else if email != "" && password != ""{
            authViewModel?.logInAuth(email: email, password: password, vc: self)
            
        }
        
    }
    
    @objc func signUpPressed(_ sender: UIButton){
        let indexPath = IndexPath(row: 1, section: 0)
        guard let cell = self.signCollectionView.cellForItem(at: indexPath) as? AuthCollectionViewCell, let email = cell.emailTxt.text, let password = cell.passwordTxt.text else {return}
        if email.isEmpty == true || password.isEmpty == true {
            AlertMsg.displayError(message: "Please Enter Empty Fields", vc: self)

        }else{
            
            authViewModel?.signUpAuth(email: email, password: password,vc: self)
            print("D")
        }
    }
    
    
    
}
