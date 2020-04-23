//
//  DatabaseService.swift
//  SprotiApp
//
//  Created by Ashraf on 4/18/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation

protocol DatabaseServiceProtocol {
   
    /*sara*/
    
    func fetchAllFavouriteLeuges(delegate:FavouriteLeugesDelegate)
    func insertFavouruteLeuge(delegate:FavouriteLeugesDelegate,  league:League)
    /*sara*/
    
    /*Ashraf*/
    func isLeagueInFavourite (leagueId:Int)->Bool
    func deleteFromFavourite(delegate:LeagueDetailDelegate, leagueId:Int)
    /*Ashraf*/
     
}
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
    /*Ashraf*/


