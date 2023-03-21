//
//  DetailsViewController.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 21/03/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var dishImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var orderTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
