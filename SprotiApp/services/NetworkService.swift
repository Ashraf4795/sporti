//
//  NetworkService.swift
//  SprotiApp
//
//  Created by Ashraf on 4/18/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class NetworkService : NetworkServiceProtocol{
   
    static let INSTANCE:NetworkServiceProtocol = NetworkService()
    /*sara*/
    /*
     a
     b
     c
     d
     e
     f
     g
     h
     i
     j
     k
     l
     m
     n
     o
     p
     q
     r
     s*/
    
    /*sara*/
    
    /*Ashraf*/
    func fetchLeaguesData(strSport: String,delegate:LeagueDelegate) {
        var leagues:[League] = []
        print("URL: \(Const.ALL_LEAGUES+strSport)")
        Alamofire.request(Const.ALL_LEAGUES+strSport).responseJSON{(response) in
            if let data = (response.data) {
                let json = JSON(data)
                for league in json["countrys"].arrayValue {
                    leagues.append(League(leagueId: league["idLeague"].intValue, strLeague: league["strLeague"].stringValue, strCountry: league["strCountry"].stringValue, strBadge: league["strBadge"].stringValue, strYoutube: league["strYoutube"].stringValue))
                }
                delegate.fetchedLeaguesData(leagues: leagues)
                print(leagues)
            }else {
                delegate.error(message: "no leagues fetched")
            }
        }
    }
    /*Ashraf*/
}
