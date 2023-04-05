//
//  AuthViewModel.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 04/04/2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
 
class AuthViewModel{
    let db : Firestore?
    init(db : Firestore){
        self.db = db

    }
    
    func signUpAuth(email: String, password: String, vc: UIViewController){
        Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
            if error == nil {
             //   guard let userId = authResult?.user.uid else {return}
                vc.dismiss(animated: true)
                
            }else{
                guard let error = error else {return}
                AlertMsg.displayError(message: "\(error.localizedDescription)", vc: vc)

                print(error)
            }
            
        }
    }
    
    func logInAuth(email: String, password: String, vc: UIViewController){
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error == nil{
                UserManager.logedUser = authResult?.user
                vc.dismiss(animated: true)
                print(authResult?.user ?? "")
            }else{
                guard let error = error else {return}
                AlertMsg.displayError(message: "\(error.localizedDescription)", vc: vc)
                print(error)
            }
        }
    }
    
}
