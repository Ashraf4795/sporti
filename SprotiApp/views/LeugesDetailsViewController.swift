//
//  leugesDetailsViewController.swift
//  SprotiApp
//
//  Created by Ashraf on 4/18/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit

class LeugesDetailsViewController: UIViewController ,LeagueDetailDelegate,UICollectionViewDataSource,UICollectionViewDelegate{
    
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    @IBOutlet weak var latestCollectionView: UICollectionView!
    
    @IBOutlet weak var teamCollectionView: UICollectionView!
    
    @IBOutlet weak var noUpcomingImage: UIImageView!
    
    @IBOutlet weak var noLatestImage: UIImageView!
    
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        //check if addToFav icon is checked or not
        // if true , add this league to favourit db
    }
    
    @IBAction func addToFav(_ sender: Any) {
    }
    var upcomingEvents:[Event] = []
    var latestResult:[Event] = []
    var teams:[Team] = []
    let placeHolderImage:String = ""

    var leagueId:Int = 123
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attachDelegate()
        let leagueDetailsPresenter = LeagueDetailsPresenter(leagueDetailDelegate: self)
        //upcoming
        leagueDetailsPresenter.fetchUpcomingEvent(_leagueId: leagueId, _url: Const.UPCOMING_EVENT)
        
        //latest Result
        leagueDetailsPresenter.fetchLatestResult(_leagueId: leagueId, _url: Const.LATEST_RESULT)
        
        //all League Team
        leagueDetailsPresenter.fetchTeamDetails(_leagueId: leagueId, _url: Const.TEAMS_DETAILS)
        
        //register upcoming cell
        upcomingCollectionView.register(UINib(nibName: "UpcomingCell", bundle: nil), forCellWithReuseIdentifier: "upcomingCell")
        
        
        //register latest cell
        latestCollectionView.register(UINib(nibName: "LatestResultCell", bundle: nil), forCellWithReuseIdentifier: "latestCell")
        
        
        //register team cell
        teamCollectionView.register(UINib(nibName: "teamCell", bundle: nil), forCellWithReuseIdentifier: "teamCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == upcomingCollectionView) {
            return upcomingEvents.count
        }else if (collectionView == latestCollectionView) {
            return latestResult.count
        }
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == upcomingCollectionView ){
            let event = upcomingEvents[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as! UpcomingCell
            cell.homeName.text = event.strHomeTeam
            cell.guestName.text = event.strAwayTeam
            cell.date.text = event.strDate
            cell.time.text = event.strTime
            let homeBadgeUrl = URL(string: event.homeBadge ?? "" )
            cell.homeBadge.kf.setImage(with:homeBadgeUrl)
            let guestBadge = URL(string: event.guestBadge ?? "" )
            cell.guestBadge.kf.setImage(with:guestBadge)
            return cell
        }else if (collectionView == latestCollectionView){
            let event = latestResult[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestCell", for: indexPath) as! LatestResultCell
            
            let homeBadgeUrl = URL(string: event.homeBadge ?? "" )
            cell.homeBadge.kf.setImage(with:homeBadgeUrl)
            let guestBadge = URL(string: event.guestBadge ?? "" )
            cell.guestBadge.kf.setImage(with:guestBadge)
            cell.homeScore.text = String(event.intHomeScore)
            cell.guestScore.text = String(event.intAwayScore)
            cell.homeName.text = event.strHomeTeam
            cell.guestName.text = event.strAwayTeam
            return cell
        }else {
            let team = teams[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! teamCell
            let teamBadgeUrl = URL(string:team.teamBadge.appending("/preview"))
            
            cell.teamBadge.kf.setImage(with: teamBadgeUrl, placeholder: UIImage(named: "placeHolder-1"))
            
            return cell
        }
    }
    
    func fetchedUpcomingEventData(events: [Event]) {
        upcomingEvents = events
        if events.count>0{
            self.upcomingCollectionView.reloadData()
        }else {
            noUpcomingImage.isHidden = false
        }
    }

    func fetchedLatestResultData(events: [Event]) {
        latestResult = events
        if(events.count>0){
        latestCollectionView.reloadData()
        }else {
            noLatestImage.isHidden = false
        }
    }
    
    func fetchedTeamDetails(teams: [Team]) {
        self.teams = teams
        upcomingEvents = Extracter.getTeamsBadges2(events: upcomingEvents, teams: teams)
        latestResult = Extracter.getTeamsBadges2(events: latestResult, teams: teams)
        upcomingCollectionView.reloadData()
        
        latestCollectionView.reloadData()
        teamCollectionView.reloadData()
    }
    
    func error(result:Result,message: String) {
        print(message)
    }

    
    
    //attach collectionViews to leaguesDetailsView delegate
    func attachDelegate (){
        //upcoming
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        
        //latest
        latestCollectionView.dataSource = self
        latestCollectionView.delegate = self
        
        //teams
        
        teamCollectionView.dataSource = self
        teamCollectionView.delegate = self
    }
}
