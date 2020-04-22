//
//  LatestResultCell.swift
//  SprotiApp
//
//  Created by Ashraf on 4/21/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit

class LatestResultCell: UICollectionViewCell {

    
    @IBOutlet weak var homeBadge: UIImageView!
    
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var guestBadge: UIImageView!

    @IBOutlet weak var guestScore: UILabel!
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var guestName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
