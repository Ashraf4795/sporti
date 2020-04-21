//
//  LeagueDetailDelegate.swift
//  SprotiApp
//
//  Created by Ashraf on 4/19/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation
protocol LeagueDetailDelegate {
    func fetchedUpcomingEventData (events:[Event])
    func fetchedLatestResultData(events:[Event])
    func fetchedTeamDetails(teams:[Team])
    func error(result:Result,message:String)
}
