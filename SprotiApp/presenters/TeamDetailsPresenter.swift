//
//  TeamDetailsPresenter.swift
//  SprotiApp
//
//  Created by saraMohamed on 4/21/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation
import Foundation
class TeamDetailPresenter {
    var teamDetailsDelegate:TeamDetailsDelegate
    var network:NetworkServiceProtocol
    
    init (teamDetailsDeleagtee:TeamDetailsDelegate){
        self.teamDetailsDelegate = teamDetailsDeleagtee
        network = NetworkService.INSTANCE
    }
    
    func fetchTeamDetails(idTeam:Int) {
        network.fetchTeamDetails(idTeam: idTeam,delegate: teamDetailsDelegate)
    }
    
}
