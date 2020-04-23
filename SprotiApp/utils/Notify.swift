//
//  Notify.swift
//  SprotiApp
//
//  Created by Ashraf on 4/22/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation
import UIKit
class Notify {
    
    
    static func showAlert (viewController:UIViewController,_title:String,_message:String) {
        
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        viewController.present(alert, animated: true)
    }
    
    static func playInYoutube(youtubeVideoUrl:String) {
        print("url : \(youtubeVideoUrl)")
        if let youtubeURL = URL(string: "https://"+youtubeVideoUrl),
            UIApplication.shared.canOpenURL(youtubeURL) {
            // redirect to app
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        } else if let youtubeURL = URL(string: "https://www.youtube.com/watch?v=InlbGIfEPQI") {
            // redirect through safari
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        }
    }
}
