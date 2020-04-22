//
//  Extracter.swift
//  SprotiApp
//
//  Created by Ashraf on 4/20/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation

class Extracter {
    
    
    static func getTeamsBadges (events:[Event],teams:[Team]) -> [Int:(badge:String,jerssy:String)] {
        var idBadgeMap = [Int:(badge:String,jerssy:String)]()
        events.forEach { event in
            teams.forEach{ team in
                if team.teamId == event.idHomeTeam {
                    idBadgeMap[team.teamId] = (team.teamBadge,team.teamJersey)
                }
                if team.teamId == event.idAwayTeam {
                    idBadgeMap[team.teamId] = (team.teamBadge,team.teamJersey)
                }
            }
        }
        return idBadgeMap
    }
    static func getTeamsBadges2 (events:[Event],teams:[Team]) -> [Event] {
        var eventsWithBadge : [Event] = []
        events.forEach { event in
            var tempEvent = Event(idLeague: event.idLeague, idEvent: event.idEvent, strEvent: event.strEvent, strHomeTeam: event.strHomeTeam, strAwayTeam: event.strAwayTeam, strDate: event.strDate, strTime: event.strTime, idHomeTeam: event.idHomeTeam, idAwayTeam: event.idAwayTeam, intHomeScore: event.intHomeScore, intAwayScore: event.intAwayScore)
            
            teams.forEach{ team in
                if team.teamId == event.idHomeTeam {
                    tempEvent.homeBadge = team.teamBadge.appending("/preview")
                }
                if team.teamId == event.idAwayTeam {
                    tempEvent.guestBadge = team.teamBadge.appending("/preview")
                }
            }
            eventsWithBadge.append(tempEvent)
        }
        print("events with badges : \(eventsWithBadge)")
        return eventsWithBadge
    }
}
