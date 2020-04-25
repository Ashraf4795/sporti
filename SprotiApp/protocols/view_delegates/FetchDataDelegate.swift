//
//  FetchDataDelegate.swift
//  SprotiApp
//
//  Created by Ashraf on 4/24/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation



protocol FetchDataDelegate {
    
    func fetchData(data:[Codable])
    
    func error (error:Result)
    
}
