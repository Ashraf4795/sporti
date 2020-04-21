//
//  LeagueDelegate.swift
//  SprotiApp
//
//  Created by Ashraf on 4/19/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation


protocol LeagueDelegate {
    
    func fetchedLeaguesData (leagues:[League])
    func error(result:Result,message:String)
}
