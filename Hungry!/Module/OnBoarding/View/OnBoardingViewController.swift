//
//  OnBoardingViewController.swift
//  Hungry!
//
//  Created by Ahmed Hamam on 19/03/2023.
//

import UIKit

class OnBoardingViewController: UIViewController {
    @IBOutlet weak var collectioView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var goNextButton: UIButton!
    
    var reuseIdentifier = "OnBoardingCollectionViewCell"
    var onBoardingViewModel : OnBoardingViewModel?
   
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage

            if currentPage == (onBoardingViewModel?.comingData?.count ?? 1)-1{
                goNextButton.setTitle("Get Started", for: .normal)
            }else{
                goNextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCell()
        setUpCollectionView()
        onBoardingViewModel = OnBoardingViewModel()
        pageControl.numberOfPages = onBoardingViewModel?.comingData?.count ?? 0
    }
    
   private func setUpCollectionView(){
        collectioView.delegate = self
        collectioView.dataSource = self
    }
    
   private func setUpCell(){
        self.collectioView.register(UINib(nibName: "OnBoardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }

    @IBAction func goNextButton(_ sender: Any) {
        guard let onBoardingArray = onBoardingViewModel?.comingData else{return}
        if currentPage == onBoardingArray.count - 1 {
            let VC = storyboard?.instantiateViewController(withIdentifier: "Home") as! UINavigationController
            present(VC, animated: true)
        }else{
           currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectioView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            print("scroll?")
            
        }
    }
    

}

extension OnBoardingViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onBoardingViewModel?.comingData?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OnBoardingCollectionViewCell
        let slide = onBoardingViewModel?.comingData?[indexPath.row] ??  onBoardingSlide(title: "no data", description: "no data.", image: #imageLiteral(resourceName: "slide3"))
        cell.setUp(slide)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectioView.frame.width, height: collectioView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x/width)
        
    }
}
