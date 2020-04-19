//
//  NetworkService.swift
//  SprotiApp
//
//  Created by Ashraf on 4/18/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation
import Alamofire
class NetworkService : NetworkServiceProtocol{
   
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
    func fetchLeaguesData(strSport: String) -> [League] {
        var leagues:[League] = []
        Alamofire.request(Const.ALL_LEAGUES).responseJSON{(response) in
            if let data = (response.data) {
                let json = JSON(data)
                for league in json["countrys"].arrayValue {
                    print(league["idLeague"].intValue)
                    self.leagues.append(League(leagueId: league["idLeague"].intValue, strLeague: league["strLeague"].stringValue, strCountry: league["strCountry"].stringValue, strBadge: league["strBadge"].stringValue, strYoutube: league["strYoutube"].stringValue))
                }
                self.printLeagues(leagues: self.leagues)
            }else {
                print("else")
            }
            
        }
    }
    /*Ashraf*/
}
