//
//  NetworkService.swift
//  SprotiApp
//
//  Created by Ashraf on 4/18/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
   /*sara*/
    //fetch all sports
    func fetchSports(delegate:SportDelegate)
    /*sara*/
    
    /*Ashraf*/
    //fetch all leagues for a specific sport
    func fetchLeaguesData(strSport:String,delegate:LeagueDelegate)
    //fetch all upcoming event with league id
    func fetchUpcomingEvent(leagueId:Int,delegate: LeagueDetailDelegate,url:String)
    /*Ashraf*/

}
