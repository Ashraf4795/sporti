//
//  LeaguePresenter.swift
//  SprotiApp
//
//  Created by Ashraf on 4/19/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation

class LeaguePresenter {
    var leagueDelegate:LeagueDelegate
    var network:NetworkServiceProtocol
    
    init (leagueDeleagte:LeagueDelegate){
        self.leagueDelegate = leagueDeleagte
        network = NetworkService.INSTANCE
    }
    
    func fetchLeaguesData(_strSport:String) {
        network.fetchLeaguesData(strSport: _strSport,delegate: leagueDelegate)
    }

    
    
    
    
}
