//
//  Match.swift
//  SprotiApp
//
//  Created by Ashraf on 4/20/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation

struct Match {
    var defaultTeam:Team = Team(teamId: 0, teamName: "", teamBadge: "", teamJersey: "")
    var homeTeam:Team
    var guestTeam:Team
}
