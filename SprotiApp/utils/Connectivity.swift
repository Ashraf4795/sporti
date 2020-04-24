//
//  Connectivity.swift
//  SprotiApp
//
//  Created by Ashraf on 4/23/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
