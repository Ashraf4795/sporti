//
//  leugesDetailsViewController.swift
//  SprotiApp
//
//  Created by Ashraf on 4/18/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit

class LeugesDetailsViewController: UIViewController ,LeagueDetailDelegate{
    
    var events:[Event] = []
    var leagueId:Int = 123
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leagueDetailsPresenter = LeagueDetailsPresenter(leagueDetailDelegate: self)
        leagueDetailsPresenter.fetchUpcomingEvent(_leagueId: leagueId, _url: Const.UPCOMING_EVENT)
        leagueDetailsPresenter.fetchTeamDetails(_leagueId: leagueId, _url: Const.TEAMS_DETAILS, delegate: self)
    }
    
    
    
    func fetchedUpcomingEventData(events: [Event]) {
        events.forEach{event in
            print("************************************")
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
        events.forEach{event in
            print("************************************")
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
    
    func fetchedTeamDetails(teams: [Team]) {
        teams.forEach{team in
            print("************************************")
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
