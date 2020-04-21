//
//  Const.swift
//  SprotiApp
//
//  Created by Ashraf on 4/19/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation

class Const {

    /*sara*/
    static let ALL_SPORTS:String = "https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
    /*sara*/
    
    /*Ashraf*/
    static let ALL_LEAGUES:String = "https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?s="
    
    static let UPCOMING_EVENT:String = "https://www.thesportsdb.com/api/v1/json/1/eventsnextleague.php?id="
    
    static let EVENT_DETAILS:String = "https://www.thesportsdb.com/api/v1/json/1/lookupevent.php?id="
    
    static let LATEST_RESULT:String = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id="
    
    static let TEAMS_DETAILS = "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id="
    /*Ashraf*/
}

enum Result {
    case ERROR
    case NO_DATA
}
