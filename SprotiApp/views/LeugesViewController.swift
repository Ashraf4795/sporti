//
//  LeugesViewController.swift
//  SprotiApp
//
//  Created by Ashraf on 4/18/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit
import Kingfisher

class LeugesViewController: UIViewController ,UITableViewDataSource,
UITableViewDelegate, LeagueDelegate {
    
    var leagues:[League] = []
    var leaguesTitle:String = "Soccer"
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view Did Load")
        let leaguePresenter:LeaguePresenter = LeaguePresenter(leagueDeleagte: self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LeagueCell", bundle: nil), forCellReuseIdentifier: "league")
        
        leaguePresenter.fetchLeaguesData(_strSport: self.leaguesTitle)	
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let league = leagues[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "league") as! LeagueCell
        cell.title.text = league.strLeague
        let badgeUrl = league.strBadge.appending("/preview")
        cell.logo.kf.setImage(with : URL(string: badgeUrl))
        
        //add youtube gesture
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
         cell.youtubeLogo.tag = indexPath.row

         tapGestureRecognizer.numberOfTapsRequired = 1
         cell.youtubeLogo.isUserInteractionEnabled = true
         cell.youtubeLogo.addGestureRecognizer(tapGestureRecognizer)
        
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "DetailsStoryboard", bundle: nil)
        guard let newViewController = storyBoard.instantiateViewController(withIdentifier: "leagueDetails") as? LeugesDetailsViewController else {
            return
        }
        newViewController.leagueId = leagues[indexPath.row].leagueId
                self.present(newViewController, animated: true, completion: nil)
    }
    func fetchedLeaguesData(leagues: [League]) {
        self.leagues = leagues
        tableView.reloadData()
    }
    
    func error(result:Result ,message: String) {
        print("error")
    }
    
    
    //youtube tapping callback
    @objc func imageTapped (tapGestureRecognizer: UITapGestureRecognizer){
        let imgView = tapGestureRecognizer.view as! UIImageView
        if(leagues[imgView.tag].strYoutube != ""){
           
        }else{
            print("no youtube url")
            //show alart dialog
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

}
