//
//  TeamDetailsViewController.swift
//  SprotiApp
//
//  Created by saraMohamed on 4/18/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit

class TeamDetailsViewController: UIViewController,TeamDetailsDelegate {
    var idTeam : Int = 0
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var twittwerImageView: UIImageView!
    @IBOutlet weak var vview: UIView!
    
    @IBOutlet weak var InstagramImageView: UIImageView!
    @IBOutlet weak var websiteImageView: UIImageView!
    @IBOutlet weak var facebookImageView: UIImageView!
    var teamDetail:TeamDetail = TeamDetail()
    
    func fetchedTeamDetails(teamDetails: TeamDetail) {
        self.teamDetail = teamDetails
        print(teamDetails.strDescriptionEN)
        print("gggffffff")
        var url = URL(string: teamDetail.strTeamBadge)
        teamImageView.kf.setImage(with: url)
        teamDescriptionTextView.text = teamDetail.strDescriptionEN
        yearLabel.text = "\(teamDetail.intFormedYear)"
        teamName.text = teamDetails.strTeam
    }
    
    func error(message: String) {
        
    }
    

    @IBOutlet weak var teamImageView: UIImageView!
    
    @IBOutlet weak var teamDescriptionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let teamDetailsPresenter:TeamDetailPresenter = TeamDetailPresenter(teamDetailsDeleagtee: self)
        teamDetailsPresenter.fetchTeamDetails(idTeam: idTeam)
        
        vview.layer.cornerRadius = 100
        facebookImageView.image = UIImage(named : "facebook.png")
        twittwerImageView.image = UIImage(named : "twitter.png")
        websiteImageView.image = UIImage(named : "website.png")
        InstagramImageView.image = UIImage(named : "instagram.png")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(TeamDetailsViewController.openfaceBook))
        facebookImageView.addGestureRecognizer(tap)
        facebookImageView.isUserInteractionEnabled = true
        
        let tapTwitter = UITapGestureRecognizer(target: self, action: #selector(TeamDetailsViewController.openTwitter))
        twittwerImageView.addGestureRecognizer(tapTwitter)
        twittwerImageView.isUserInteractionEnabled = true
        let tapwrbsite = UITapGestureRecognizer(target: self, action: #selector(TeamDetailsViewController.openWebsite))
        websiteImageView.addGestureRecognizer(tapwrbsite)
        websiteImageView.isUserInteractionEnabled = true
        let tapinstagram = UITapGestureRecognizer(target: self, action: #selector(TeamDetailsViewController.openInstagram))
        InstagramImageView.addGestureRecognizer(tapinstagram)
        InstagramImageView.isUserInteractionEnabled = true
    }
    @objc func openfaceBook()
    {
        let url = NSURL(string : "https://\(teamDetail.strFacebook)")
        print(teamDetail.strFacebook)
        UIApplication.shared.openURL(url as! URL)
    }

    @objc func openTwitter()
    {
        let url = NSURL(string : "https://\(teamDetail.strTwitter)")
        print(teamDetail.strFacebook)
        UIApplication.shared.openURL(url as! URL)
    }
    @objc func openInstagram()
    {
        let url = NSURL(string : "https://\(teamDetail.strInstagram)")
        print(teamDetail.strFacebook)
        UIApplication.shared.openURL(url as! URL)
    }
    @objc func openWebsite()
    {
        let url = NSURL(string : "https://\(teamDetail.strWebsite)")
        print(teamDetail.strFacebook)
        UIApplication.shared.openURL(url as! URL)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
