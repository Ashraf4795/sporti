//
//  SportDelegate.swift
//  SprotiApp
//
//  Created by saraMohamed on 4/20/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation
protocol SportDelegate {
    func fetchedSports(sports:[Sport])
    func error(message:String)
}
