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
    
    
    /*sara*/
    
    /*Ashraf*/
    //fetch all leagues for a specific sport
    func fetchLeaguesData(strSport:String)->[League]
    /*Ashraf*/

}
