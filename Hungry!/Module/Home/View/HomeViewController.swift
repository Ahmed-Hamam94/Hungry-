//
//  HomeViewController.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 20/03/2023.
//

import UIKit
import KRProgressHUD
class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var chefCollectionView: UICollectionView!
    
    
    var homeViewModel : HomeViewModel?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel = HomeViewModel()
        setUpCollections()
        setUpCell()
        homeCollectionsReload()
        categoriesIsFinished()
    }
    
    
    private func setUpCollections(){
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        chefCollectionView.delegate = self
        chefCollectionView.dataSource = self
    }
    private func setUpCell(){
        categoryCollectionView.registerCelNib(cellClass: CategoryCollectionViewCell.self)
        popularCollectionView.registerCelNib(cellClass: PopularCollectionViewCell.self)
        chefCollectionView.registerCelNib(cellClass: ChefCollectionViewCell.self)
    }
    
    private func homeCollectionsReload(){
        homeViewModel?.bindingCategories = { [weak self]  in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.categoryCollectionView.reloadData()
                self.popularCollectionView.reloadData()
                self.chefCollectionView.reloadData()
                
            }
        }
    }
    private func categoriesIsFinished(){
        homeViewModel?.callFuncToGetCategories(completionHandler: { (isFinished) in
            if isFinished == false{
                KRProgressHUD.show()
            }else {
                KRProgressHUD.dismiss()
            }
            
        })
    }
    
    @IBAction func signInOutBtn(_ sender: UIBarButtonItem) {
        guard let authVC = storyboard?.instantiateViewController(withIdentifier: "AuthViewController") as? AuthViewController else {return}
        UserManager.logedUser = nil
        print("\(UserManager.logedUser)")
        self.present(authVC, animated: true)
    }
    @IBAction func cartBtn(_ sender: UIBarButtonItem) {
        if UserManager.logedUser == nil {
            AlertMsg.displayError(message: "Login first", vc: self)
        }else{
            let ordersVC = storyboard?.instantiateViewController(withIdentifier: "OrdersViewController") as! OrdersViewController
            self.navigationController?.pushViewController(ordersVC, animated: true)
        }
        
    }
    
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionView:
            return homeViewModel?.categories?.count ?? 0
        case popularCollectionView:
            return homeViewModel?.popularDishes?.count ?? 0
        case chefCollectionView:
            return homeViewModel?.chefSpecials?.count ?? 2
        default: return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
        case categoryCollectionView:
            guard let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else{fatalError("error")}
            
            if let category = homeViewModel?.categories?[indexPath.row]{
                categoryCell.setUp(category: category)
            }
            
            return categoryCell
            
        case popularCollectionView:
            guard let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as? PopularCollectionViewCell else{fatalError("error")}
            
            if let dish = homeViewModel?.popularDishes?[indexPath.row]{
                popularCell.setUp(dish: dish)
            }
            return popularCell
            
        case chefCollectionView:
            guard let specialCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChefCollectionViewCell", for: indexPath) as? ChefCollectionViewCell else{fatalError("error")}
            
            if let special = homeViewModel?.chefSpecials?[indexPath.row]{
                specialCell.setUp(dish: special)
            }
            return specialCell
            
        default: return UICollectionViewCell()
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView{
        case categoryCollectionView:
            return CGSize(width: 150, height: 60)
            
        case popularCollectionView:
            return CGSize(width: (collectionView.frame.width/2)-1, height: popularCollectionView.frame.height
            )
        case chefCollectionView:
            return CGSize(width: collectionView.frame.width, height: chefCollectionView.frame.height
            )
            
        default: return CGSize(width: 0, height: 0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        switch collectionView{
        case categoryCollectionView:
            return 2
        case popularCollectionView:
            return 10
        case chefCollectionView:
            return 2
        default: return 0
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView{
        case categoryCollectionView:
            return 0.5
        case popularCollectionView:
            return 0.1
        case chefCollectionView:
            return 0.0
        default: return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            let VC = ListDishesViewController.instantiate()
            VC.category = homeViewModel?.categories?[indexPath.row]
            navigationController?.pushViewController(VC, animated: true)
        }else{
            let VC = DetailsViewController.instantiate()
            switch collectionView{
            case popularCollectionView:
                
                VC.dish = (homeViewModel?.popularDishes?[indexPath.row])
                
            case chefCollectionView:
                
                VC.dish = (homeViewModel?.chefSpecials?[indexPath.row])
                
            default:
                print("error")
            }
            
            navigationController?.pushViewController(VC, animated: true)
        }
    }
    
}
