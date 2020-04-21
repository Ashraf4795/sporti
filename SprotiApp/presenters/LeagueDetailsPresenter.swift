//
//  LeagueDetailsPresenter.swift
//  SprotiApp
//
//  Created by Ashraf on 4/19/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation
class LeagueDetailsPresenter {
    var leagueDetailDelegate:LeagueDetailDelegate
    var network:NetworkServiceProtocol
    
    init (leagueDetailDelegate:LeagueDetailDelegate){
        self.leagueDetailDelegate = leagueDetailDelegate
        network = NetworkService.INSTANCE
    }
    
    func fetchUpcomingEvent(_leagueId:Int,_url:String) {
        network.fetchUpcomingEvent(leagueId: _leagueId, delegate: leagueDetailDelegate,url:_url)
    }
    
    func fetchTeamDetails(_leagueId:Int,_url:String,delegate:LeagueDetailDelegate) {
        network.fetchTeamsInAleague(leagueId: _leagueId, url: _url, delegate: delegate)
    }

    
    
    
    
}
