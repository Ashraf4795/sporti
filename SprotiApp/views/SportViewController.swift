//
//  SportViewController.swift
//  SprotiApp
//
//  Created by Ashraf on 4/18/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit
import Kingfisher

class SportViewController: UIViewController ,SportDelegate,UICollectionViewDataSource,UICollectionViewDelegate {
 
    @IBOutlet weak var loadingProgress: UIActivityIndicatorView!
    
    @IBOutlet weak var sportCollectionView: UICollectionView!
    var sports:[Sport] = []

   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let sportPresenter:SportPresenter = SportPresenter(sportDeleagtee:self)
        sportCollectionView.delegate = self
        sportCollectionView.dataSource = self
        
    sportPresenter.fetchSport()
        let numberOfCell = 2
        let cellSpacing = 10
        if let layout = sportCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        {
            layout.itemSize = CGSize(width :(Int(view.frame.width) - (cellSpacing * (numberOfCell+1)))/numberOfCell , height :155 )
        }
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportCell", for: indexPath) as! SportCell
        cell.strSportLabel.text = sports[indexPath.row].strSport
        var url = URL(string: sports[indexPath.row].strSportThumb)
        cell.strSportThumbImageView.kf.setImage(with: url)

        return cell
    }
    func fetchedSports(sports: [Sport]) {
        self.sports = sports
        if (sports.count == 0 )
        {
            loadingProgress.startAnimating()
        }
        else
        {
            loadingProgress.stopAnimating()
            loadingProgress.hidesWhenStopped = true
        }
        sportCollectionView.reloadData()
    }
    
    func error(message: String) {
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 2
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        
        return CGSize(width: size, height: size)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let storyboard = UIStoryboard(name: "DetailsStoryboard",bundle:nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "leugesId") as! LeugesViewController
        viewController.leaguesTitle = sports[indexPath.row].strSport
        viewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
 
  
   
   
}


