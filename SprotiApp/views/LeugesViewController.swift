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
    
    let youtubeLogo = UIImage(named:"youtube")
    
    var leagues:[League] = []
    var leaguesTitle:String = "Soccer"
    var selectedLegue:League?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = leaguesTitle
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
        
        if (!league.strYoutube.isEmpty){
            cell.youtubeLogo.image = self.youtubeLogo
        }else{
            cell.youtubeLogo.isHidden = true
        }
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
        
        selectedLegue = leagues[indexPath.row]
        performSegue(withIdentifier: "goToDetails", sender: self)
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
        if(!leagues[imgView.tag].strYoutube.isEmpty){
            print("have youtube")
            Notify.playInYoutube(youtubeVideoUrl: leagues[imgView.tag].strYoutube)
        }else{
            print(leagues[imgView.tag].strYoutube)
            print("no youtube url")
            //show alart dialog
            Notify.showAlert(viewController: self, _title: "No Video Found", _message: "This video no avalible at this time")
        }
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as! LeugesDetailsViewController
        detailsVC.selectedLeague = self.selectedLegue
        detailsVC.modalPresentationStyle = .fullScreen
    }
    
    
    
}
