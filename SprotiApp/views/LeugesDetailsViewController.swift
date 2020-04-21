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
    
    var upcomingEvents:[Event] = []
    var latestResult:[Event] = []
    var teams:[Team] = []
            

    var leagueId:Int = 123
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leagueDetailsPresenter = LeagueDetailsPresenter(leagueDetailDelegate: self)
        //upcoming
        leagueDetailsPresenter.fetchUpcomingEvent(_leagueId: leagueId, _url: Const.UPCOMING_EVENT)
        
        //latest Result
        leagueDetailsPresenter.fetchLatestResult(_leagueId: leagueId, _url: Const.LATEST_RESULT)
        
        //all League Team
        leagueDetailsPresenter.fetchTeamDetails(_leagueId: leagueId, _url: Const.TEAMS_DETAILS)
        
        //register upcoming cell
        upcomingCollectionView.register(UINib(nibName: "UpcomingCell", bundle: nil), forCellWithReuseIdentifier: "upcomingCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == upcomingCollectionView) {
            return upcomingEvents.count
        }
        return upcomingEvents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let event = upcomingEvents[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as! UpcomingCell
        cell.homeName.text = event.strHomeTeam
        cell.guestName.text = event.strAwayTeam
        cell.date.text = event.strDate
        cell.time.text = event.strTime
        return cell
    }
    
    func fetchedUpcomingEventData(events: [Event]) {
        upcomingEvents = events
        self.upcomingCollectionView.reloadData()
        print("**************** UPCOMING ********************")
        events.forEach{event in
            print("==========================")
            print("ID: \(event.idEvent)")
            print("Event Title: \(event.strEvent)")
            print("Home: \(event.strHomeTeam)")
            print("Guest: \(event.strAwayTeam)")
            print("Time: \(event.strTime)")
            print("Date: \(event.strDate)")
            print("League ID: \(event.idLeague)")
            print("Home ID: \(event.idHomeTeam)")
            print("Guest ID: \(event.idAwayTeam)")
            print("")
        }
    }

    func fetchedLatestResultData(events: [Event]) {
        latestResult = events
        print("**************** Latest Result ********************")
        events.forEach{event in
            print("==========================")
            print("ID: \(event.idEvent)")
            print("Event Title: \(event.strEvent)")
            print("Home: \(event.strHomeTeam)")
            print("Guest: \(event.strAwayTeam)")
            print("Home Score: \(event.intHomeScore)")
            print("Guest Score: \(event.intAwayScore)")
            print("Time: \(event.strTime)")
            print("Date: \(event.strDate)")
            print("League ID: \(event.idLeague)")
            print("Home ID: \(event.idHomeTeam)")
            print("Guest ID: \(event.idAwayTeam)")
            print("")
        }
    }
    
    func fetchedTeamDetails(teams: [Team]) {
        self.teams = teams
        print("**************** Teams Details ********************")
        teams.forEach{team in
            print("==========================")
            print("ID: \(team.teamId)")
            print("Team Title: \(team.teamName)")
            print("Badge: \(team.teamBadge)")
            print("Jerssey: \(team.teamJersey)")
            print("")
        }
    }
    
    func error(result:Result,message: String) {
        print(message)
    }

}
