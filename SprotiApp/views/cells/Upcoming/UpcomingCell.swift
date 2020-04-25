//
//  UpcomingCell.swift
//  SprotiApp
//
//  Created by Ashraf on 4/20/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit
import Kingfisher

class UpcomingCell: UICollectionViewCell {

    
    @IBOutlet private weak var homeBadge: UIImageView!
    @IBOutlet private weak var guestBadge: UIImageView!
    @IBOutlet private weak var homeName: UILabel!
    @IBOutlet private weak var guestName: UILabel!
    @IBOutlet private weak var date: UILabel!
    @IBOutlet private weak var time: UILabel!
    
    func setCell (event :Event){
        homeName.text = event.strHomeTeam
        guestName.text = event.strAwayTeam
        date.text = event.strDate
        time.text = event.strTime

        let homeBadgeUrl = URL(string: event.homeBadge ?? "" )
        let guestBadgeUrl = URL(string: event.guestBadge ?? "" )

        homeBadge.kf.setImage(with:homeBadgeUrl)
        guestBadge.kf.setImage(with:guestBadgeUrl)
    }
}
