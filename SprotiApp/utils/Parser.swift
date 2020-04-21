//
//  Parser.swift
//  SprotiApp
//
//  Created by Ashraf on 4/18/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation
import SwiftyJSON
class Parser {
    
    /*sara*/
    /*sara*/
    
    
    /*Ashraf*/
    static func parseUpcomingEvent(json:JSON) -> [Event]{
        var events:[Event] = []
        for innerEvent in json["events"].arrayValue {
            let eventId = innerEvent["idEvent"].intValue
            events.append(Event(idLeague: innerEvent["idLeague"].intValue, idEvent: eventId, strEvent: innerEvent["strEvent"].stringValue, strHomeTeam: innerEvent["strHomeTeam"].stringValue, strAwayTeam: innerEvent["strAwayTeam"].stringValue, strDate: innerEvent["strDate"].stringValue, strTime: innerEvent["strTime"].stringValue, idHomeTeam: innerEvent["idHomeTeam"].intValue, idAwayTeam: innerEvent["idAwayTeam"].intValue, intHomeScore: innerEvent["intHomeScore"].intValue, intAwayScore: innerEvent["intAwayScore"].intValue))
        }
        return events
    }
    
    static func parseLatestResult(json:JSON) -> [Event]{
        var events:[Event] = []
        for innerEvent in json["events"].arrayValue {
            let eventId = innerEvent["idEvent"].intValue
            events.append(Event(idLeague: innerEvent["idLeague"].intValue, idEvent: eventId, strEvent: innerEvent["strEvent"].stringValue, strHomeTeam: innerEvent["strHomeTeam"].stringValue, strAwayTeam: innerEvent["strAwayTeam"].stringValue, strDate: innerEvent["strDate"].stringValue, strTime: innerEvent["strTime"].stringValue, idHomeTeam: innerEvent["idHomeTeam"].intValue, idAwayTeam: innerEvent["idAwayTeam"].intValue, intHomeScore: innerEvent["intHomeScore"].intValue, intAwayScore: innerEvent["intAwayScore"].intValue))
        }
        return events
    }
    
    static func parseLeaguesData (json:JSON)->[League] {
        var leagues : [League] = []
        for league in json["countrys"].arrayValue {
             print(league["idLeague"].intValue)
            leagues.append(League(leagueId: league["idLeague"].intValue, strLeague: league["strLeague"].stringValue, strCountry: league["strCountry"].stringValue, strBadge: league["strBadge"].stringValue, strYoutube: league["strYoutube"].stringValue))
        }
        return leagues
    }
    
    static func parseTeamsDetails(json:JSON)->[Team] {
        var teams:[Team] = []
        for team in json["teams"].arrayValue {
            teams.append(Team(teamId: team["idTeam"].intValue, teamName: team["strTeam"].stringValue, teamBadge: team["strTeamBadge"].stringValue,teamJersey: team["strTeamJersey"].stringValue))
        }
        return teams
    }
    /*Ashraf*/
}
