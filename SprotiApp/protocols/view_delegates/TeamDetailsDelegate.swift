//
//  TeamDetailsDelegate.swift
//  SprotiApp
//
//  Created by saraMohamed on 4/21/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation
import Foundation
protocol TeamDetailsDelegate {
    func fetchedTeamDetails(teamDetails: TeamDetail)
    func error(message:String)
}
