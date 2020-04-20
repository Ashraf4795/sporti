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
    
    //fetch leagues data with sport title
    func fetchLeaguesData(strSport: String,delegate:LeagueDelegate) {
        var leagues:[League] = []
        print("URL: \(Const.ALL_LEAGUES+strSport)")
        Alamofire.request(Const.ALL_LEAGUES+strSport).responseJSON{(response) in
            if let data = (response.data) {
                let json = JSON(data)
               
                for league in json["countrys"].arrayValue {
                     print(league["idLeague"].intValue)
                    leagues.append(League(leagueId: league["idLeague"].intValue, strLeague: league["strLeague"].stringValue, strCountry: league["strCountry"].stringValue, strBadge: league["strBadge"].stringValue, strYoutube: league["strYoutube"].stringValue))
                }
                delegate.fetchedLeaguesData(leagues: leagues)
                print(leagues)
            }else {
                delegate.error(message: "no leagues fetched")
            }
        }
    }
    
    
    //fetch all upcoming event with league id
    func fetchUpcomingEvent(leagueId: Int, delegate: LeagueDetailDelegate,url:String) {
        var events:[Event] = []
        print("upcoming URL: \(url+String(leagueId))")
        Alamofire.request(url+String(leagueId)).responseJSON{(response) in
            if let data = (response.data) {
                let json = JSON(data)
                for innerEvent in json["events"].arrayValue {
                    let eventId = innerEvent["idEvent"].intValue
                    events.append(Event(idLeague: innerEvent["idLeague"].intValue, idEvent: eventId, strEvent: innerEvent["strEvent"].stringValue, strHomeTeam: innerEvent["strHomeTeam"].stringValue, strAwayTeam: innerEvent["strAwayTeam"].stringValue, strDate: innerEvent["strDate"].stringValue, strTime: innerEvent["strTime"].stringValue, idHomeTeam: innerEvent["idHomeTeam"].intValue, idAwayTeam: innerEvent["idAwayTeam"].intValue, intHomeScore: innerEvent["intHomeScore"].intValue, intAwayScore: innerEvent["intAwayScore"].intValue))

                }
                delegate.fetchedUpcomingEventData(events: events)
            }else {
                delegate.error(message: "no events fetched")
            }
        }
    }
      
    
    /*Ashraf*/
}
