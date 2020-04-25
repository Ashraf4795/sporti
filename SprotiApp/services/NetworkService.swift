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

    //get all sports
    func fetchSports(delegate: SportDelegate) {
        var sports:[Sport] = []
        Alamofire.request(Const.ALL_SPORTS).responseJSON{(response) in
            if let data = (response.data) {
                let json = JSON(data)
            
                for sport in json["sports"].arrayValue {
                    sports.append(Sport(strSport: sport["strSport"].stringValue, strSportThumb: sport["strSportThumb"].stringValue))
                }
                delegate.fetchedSports(sports: sports)
            }else {
                delegate.error(message: "no sports fetched")
            }
        }
    }
    //
    func fetchTeamDetails(idTeam :Int,delegate: TeamDetailsDelegate) {
        var teamdetails:TeamDetail = TeamDetail()
        Alamofire.request(Const.TEAM_DETAILSS+"\(idTeam)").responseJSON{(response) in
            if let data = (response.data) {
                let json = JSON(data)
                //   print(json)
                teamdetails = Parser.parseTeamDetails(json: json)
                delegate.fetchedTeamDetails(teamDetails: teamdetails)
                // print("\(teamdetails.strDescriptionEN) hijiokouio")
            }else {
                delegate.error(message: "no team details fetched")
            }
        }
    }
    
    //fetch leagues data with sport title
    func fetchLeaguesData(strSport: String,delegate:LeagueDelegate) {
        var leagues:[League] = []
        print("URL: \(Const.ALL_LEAGUES+strSport)")
        Alamofire.request(Const.ALL_LEAGUES+strSport).responseJSON{(response) in
            if response.result.isSuccess {
                if let data = (response.data) {
                    let json = JSON(data)
                   
                    leagues = Parser.parseLeaguesData(json: json)
                    delegate.fetchedLeaguesData(leagues: leagues)
                    print(leagues)
                }else {
                    delegate.error(result:Result.NO_DATA, message: "No Data Fetched")
                }
            }else {
                delegate.error(result: Result.ERROR, message: "Network Error")
            }
        }
    }
    
    //fetch all upcoming event with league id
    func fetchUpcomingEvent(leagueId: Int, delegate: LeagueDetailDelegate,url:String) {
        var events:[Event] = []
        print("upcoming URL: \(url+String(leagueId))")
        Alamofire.request(url+String(leagueId)).responseJSON{(response) in
            if response.result.isSuccess {
                if let data = (response.data) {
                    let json = JSON(data)
                    events = Parser.parseUpcomingEvent(json: json)
                    delegate.fetchedUpcomingEventData(events: events)
                }else {
                    delegate.error(result:Result.NO_DATA,message: "No Data Fetched")
                }
            }else {
                delegate.error(result: Result.ERROR, message: "Network Error")
            }
        }
    }
    
    //fetch all Latest Result with league id
    func fetchLatestResult(leagueId: Int, delegate: LeagueDetailDelegate,url:String) {
        var events:[Event] = []
        print("Latest Result URL: \(url+String(leagueId))")
        Alamofire.request(url+String(leagueId)).responseJSON{(response) in
            if response.result.isSuccess {
                if let data = (response.data) {
                    let json = JSON(data)
                    events = Parser.parseLatestResult(json: json)
                    delegate.fetchedLatestResultData(events: events)
                }else {
                    delegate.error(result:Result.NO_DATA,message: "No Data Fetched")
                }
            }else {
                delegate.error(result: Result.ERROR, message: "Network Error")
            }
        }
    }
      
    // fetch all teams in a league
    func fetchTeamsInAleague(leagueId: Int, url: String, delegate: LeagueDetailDelegate) {
        var teams:[Team] = []
        Alamofire.request(url+String(leagueId)).responseJSON{(response) in
            if response.result.isSuccess {
                if let data = (response.data) {
                    let json = JSON(data)
                    teams = Parser.parseTeamsDetails(json: json)
                    delegate.fetchedTeamDetails(teams: teams)
                }else {
                    delegate.error(result:Result.NO_DATA,message: "No Data Fetched")
                }
            }else {
                delegate.error(result: Result.ERROR, message: "Network Error")
            }
        }
    }
}
