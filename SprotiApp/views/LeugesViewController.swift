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
        cell.logo.kf.setImage(with : URL(string: league.strBadge))
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        leagues.count
    }
    
    func fetchedLeaguesData(leagues: [League]) {
        self.leagues = leagues
        tableView.reloadData()
    }
    
    func error(message: String) {
        print("error")
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
