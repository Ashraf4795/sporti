//
//  leugesDetailsViewController.swift
//  SprotiApp
//
//  Created by Ashraf on 4/18/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit

class LeugesDetailsViewController: UIViewController ,LeagueDetailDelegate{
    
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
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    func fetchedUpcomingEventData(events: [Event]) {
        upcomingEvents = events
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
