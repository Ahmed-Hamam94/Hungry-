//
//  OrdersViewController.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 22/03/2023.
//

import UIKit
import KRProgressHUD
class OrdersViewController: UIViewController {

    @IBOutlet weak var ordersTableView: UITableView!
    var ordersViewModel: OredersViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        ordersViewModel = OredersViewModel()
       ordersReload()
        dishesIsFinished()
        setUpTable()
    }
    
    private func setUpTable(){
        ordersTableView.delegate = self
        ordersTableView.dataSource = self
        ordersTableView.registerCelNib(cellClass: ListDishesTableViewCell.self)
    }
    private func dishesIsFinished(){
        ordersViewModel?.callFuncToDishes(completionHandler: { (isFinished) in
            if !isFinished {
                KRProgressHUD.show()
            }else {
                KRProgressHUD.dismiss()
            }
        })
    }
    private func ordersReload(){
        ordersViewModel?.bindingOrders = { [weak self] in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.ordersTableView.reloadData()
            }
        }
    }
  

}

extension OrdersViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersViewModel?.orders?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListDishesTableViewCell", for: indexPath) as! ListDishesTableViewCell
        if let order = ordersViewModel?.orders?[indexPath.row]{
            cell.setUpOrder(order: order)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = DetailsViewController.instantiate()
        VC.dish = ordersViewModel?.orders?[indexPath.row].dish
        navigationController?.pushViewController(VC, animated: true)
    }
}
