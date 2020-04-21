//
//  FavouriteLeugesDelegate.swift
//  SprotiApp
//
//  Created by saraMohamed on 4/20/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation
protocol FavouriteLeugesDelegate {
    func fetchedFavouriteLeuges(leuges:[League])
    func error(message:String)
}
