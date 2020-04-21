//
//  FavouritLeugesViewController.swift
//  SprotiApp
//
//  Created by Ashraf on 4/18/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit

class FavouritLeugesViewController: UIViewController,FavouriteLeugesDelegate,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var emptyState: UIView!
    @IBOutlet weak var emptyImageView: UIImageView!
    
    
    var leagues:[League] = []

    @IBOutlet weak var favouriteLeugeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let favouriteLeaguePresenter:FavouriteLeugePresenter = FavouriteLeugePresenter(favouriteLeugeDelegate: self)
        favouriteLeugeTableView.delegate = self
        favouriteLeugeTableView.dataSource = self
        favouriteLeugeTableView.register(UINib(nibName: "LeagueCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        favouriteLeaguePresenter.fetchFavouriteLeuges()
        emptyImageView.image = UIImage(named : "empty.png")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func fetchedFavouriteLeuges(leuges: [League]) {
        self.leagues = leuges
        if(leagues.count == 0 )
        {
            emptyState.isHidden = false
            favouriteLeugeTableView.isHidden = true
        }
        else
        {
            emptyState.isHidden = true
            favouriteLeugeTableView.isHidden = false
        }
    }
    
    func error(message: String) {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let league = leagues[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LeagueCell
        cell.title.text = league.strLeague
        cell.logo.kf.setImage(with : URL(string: league.strBadge))
        
        //add youtube gesture
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        cell.youtubeLogo.tag = indexPath.row
        
        tapGestureRecognizer.numberOfTapsRequired = 1
        cell.youtubeLogo.isUserInteractionEnabled = true
        cell.youtubeLogo.addGestureRecognizer(tapGestureRecognizer)
        
        return cell
    }
    @objc func imageTapped (tapGestureRecognizer: UITapGestureRecognizer){
        let imgView = tapGestureRecognizer.view as! UIImageView
        if(leagues[imgView.tag].strYoutube != ""){
            
        }else{
            print("no youtube url")
            //show alart dialog
        }
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailsStoryboard",bundle:nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "leagueDetails") as! LeugesDetailsViewController
        viewController.leagueId = leagues[indexPath.row].leagueId
        present(viewController, animated: true, completion: nil)
    }
    
}
