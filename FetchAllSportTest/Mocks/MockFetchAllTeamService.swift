//
//  MockFetchAllTeamService.swift
//  FetchAllSportTest
//
//  Created by Ashraf on 4/30/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation

@testable import SprotiApp
class MockFetchAllTeamService {
    
    var network:NetworkServiceProtocol = NetworkService()
    var shouldDelegateError = false
   
    
    var mockTeamData:[String:Any] = [
        "idTeam": 135120,
        "strTeam": "G-Drive Racing",
        "strSport": "Motorsport",
        "intFormedYear": "",
        "strLeague": "_Defunct Motorsport Teams",
        "idLeague": "4522",
        "strWebsite": "",
        "strFacebook": "www.facebook.com/GDriveRacing",
        "strTwitter": "twitter.com/GDrive_Racing",
        "strInstagram": "",
        "strTeamBadge": ""
    ]
    init (shouldDelegateError:Bool){
        self.shouldDelegateError = shouldDelegateError
    }
    
    
}



extension MockFetchAllTeamService : NetworkServiceProtocol {
    
    
    func fetchSports(delegate: SportDelegate) {
        
    }
    
    func fetchTeamDetails(idTeam: Int, delegate: TeamDetailsDelegate) {
        if shouldDelegateError {
            delegate.error(message: "Error")
        }else {
            let teamDetails:TeamDetail = TeamDetail()
            
            teamDetails.idTeam = mockTeamData["idTeam"] as! Int
            teamDetails.strFacebook = mockTeamData["strFacebook"] as! String
            teamDetails.strInstagram = mockTeamData["strInstagram"] as! String
            teamDetails.strTeam = mockTeamData["strTeam"] as! String
            teamDetails.strTeamBadge = mockTeamData["strTeamBadge"] as! String
            teamDetails.strTwitter = mockTeamData["strTwitter"] as! String
            teamDetails.strWebsite = mockTeamData["strWebsite"] as! String
            
            delegate.fetchedTeamDetails(teamDetails: teamDetails)
        }
    }
    
    func fetchLeaguesData(strSport: String, delegate: LeagueDelegate) {
        
    }
    
    func fetchUpcomingEvent(leagueId: Int, delegate: LeagueDetailDelegate, url: String) {
        
    }
    
    func fetchLatestResult(leagueId: Int, delegate: LeagueDetailDelegate, url: String) {
        
    }
    
    func fetchTeamsInAleague(leagueId: Int, url: String, delegate: LeagueDetailDelegate) {
        
    }
    
    
}


