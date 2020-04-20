//
//  leugesDetailsViewController.swift
//  SprotiApp
//
//  Created by Ashraf on 4/18/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit

class LeugesDetailsViewController: UIViewController ,LeagueDetailDelegate{
    
    var events:[Event] = []
    var leagueId:Int = 123
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leagueDetailsPresenter = LeagueDetailsPresenter(leagueDetailDelegate: self)
        leagueDetailsPresenter.fetchUpcomingEvent(_leagueId: leagueId,_url:Const.UPCOMING_EVENT)
    }
    
    
    
    func fetchedUpcomingEventData(events: [Event]) {
        print("event from view \(events)")
    }
    
    func error(message: String) {
        print(message)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
