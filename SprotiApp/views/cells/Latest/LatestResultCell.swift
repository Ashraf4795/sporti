//
//  LatestResultCell.swift
//  SprotiApp
//
//  Created by Ashraf on 4/21/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit
import Kingfisher
class LatestResultCell: UICollectionViewCell {

    
    @IBOutlet weak var homeBadge: UIImageView!
    
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var guestBadge: UIImageView!

    @IBOutlet weak var guestScore: UILabel!
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var guestName: UILabel!
    
    func setCell(event:Event) {
        let homeBadgeUrl = URL(string: event.homeBadge ?? "" )
        let guestBadgeUrl = URL(string: event.guestBadge ?? "" )

        homeBadge.kf.setImage(with:homeBadgeUrl)
        guestBadge.kf.setImage(with:guestBadgeUrl)
        
        homeScore.text = String(event.intHomeScore)
        guestScore.text = String(event.intAwayScore)
        homeName.text = event.strHomeTeam
        guestName.text = event.strAwayTeam
    }

}
