//
//  LeagueCell.swift
//  SprotiApp
//
//  Created by Ashraf on 4/19/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit

class LeagueCell: UITableViewCell {

    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    
    @IBOutlet weak var youtubeLogo: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
