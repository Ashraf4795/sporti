//
//  SportPresenter.swift
//  SprotiApp
//
//  Created by saraMohamed on 4/20/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation
class SportPresenter {
    var sportDelegate:SportDelegate
    var network:NetworkServiceProtocol
    
    init (sportDeleagtee:SportDelegate){
        self.sportDelegate = sportDeleagtee
        network = NetworkService.INSTANCE
    }
    
    func fetchSport() {
        network.fetchSports(delegate: sportDelegate)
    }
    
    
    
    
    
}
