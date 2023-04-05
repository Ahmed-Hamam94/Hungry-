//
//  ListDishesViewController.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 21/03/2023.
//

import UIKit
import KRProgressHUD
class ListDishesViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var listDishesTableView: UITableView!
    var listDishesViewModel: ListDishesViewModel?
    var category : DishCategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listDishesViewModel = ListDishesViewModel(category: category)
        title = listDishesViewModel?.category?.title
        
        setUpTable()
        listDishesReload()
        listDishesIsFinished()
        
    }
    
    private func setUpTable(){
        listDishesTableView.delegate = self
        listDishesTableView.dataSource = self
        listDishesTableView.registerCelNib(cellClass: ListDishesTableViewCell.self)
    }
    
    private func listDishesReload(){
        listDishesViewModel?.bindingCategories = { [weak self] in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.listDishesTableView.reloadData()
            }
        }
    }
    
    private func listDishesIsFinished(){
        listDishesViewModel?.callFuncToDishes(completionHandler: { (isFinished) in
            if !isFinished {
                KRProgressHUD.show()
            }else {
                KRProgressHUD.dismiss()
            }
        })
    }
}

extension ListDishesViewController: UITextViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDishesViewModel?.dishes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListDishesTableViewCell", for: indexPath) as! ListDishesTableViewCell
        if let dish = listDishesViewModel?.dishes?[indexPath.row]{
            cell.setUp(dish: dish)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = DetailsViewController.instantiate()
        if let dish = listDishesViewModel?.dishes?[indexPath.row]{
            print(dish)
            VC.dish = dish
        }
        navigationController?.pushViewController(VC, animated: true)
    }
}
