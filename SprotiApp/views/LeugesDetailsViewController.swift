//
//  leugesDetailsViewController.swift
//  SprotiApp
//
//  Created by Ashraf on 4/18/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit


class LeugesDetailsViewController: UIViewController ,LeagueDetailDelegate,UICollectionViewDataSource,UICollectionViewDelegate , FavouriteLeugesDelegate{
    let fillIcon = UIImage(named: "star.fill")
    let notFillIcon = UIImage(named:"star")
    
    //is this league in favouirt
    var isFavourit:Bool = false
    //instance of db
    let db:DatabaseServiceProtocol = DatabaseService.INSTANCE
    
    @IBOutlet weak var navBar: UINavigationBar!
    

    @IBOutlet weak var addToFav: UIButton!
    
    @IBAction func addToFavClick(_ sender: Any) {
        print("clicked")
        isFavourit = !isFavourit
        if isFavourit && addToFav.imageView?.image != fillIcon{
            addToFav.setImage(fillIcon, for: .normal)
            db.insertFavouruteLeuge(delegate: self, league: selectedLeague!)
        }else {
            addToFav.setImage(notFillIcon, for: .normal)
        }
    }
    
    
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    @IBOutlet weak var latestCollectionView: UICollectionView!
    
    @IBOutlet weak var teamCollectionView: UICollectionView!
    
    @IBOutlet weak var noUpcomingImage: UIImageView!
    
    @IBOutlet weak var noLatestImage: UIImageView!
    
    @IBAction func retry(_ sender: Any) {
    }
    
    @IBAction func back(_ sender: Any) {
        if !isFavourit {
            db.deleteFromFavourite(delegate: self, leagueId: selectedLeague!.leagueId)
        }
        self.dismiss(animated: true, completion: nil)
        //TODO:check if addToFav icon is checked or not
        // if true , add this league to favourit db
        
    }
    
   
    
    var upcomingEvents:[Event] = []
    var latestResult:[Event] = []
    var teams:[Team] = []
    let placeHolderImage:String = ""

    var leagueId:Int = 123
    var selectedLeague:League?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attachDelegate()
        setUpCollectionViewsSizeConfiguration()
        //TODO:check if this leagues is in favourit database or not
        isFavourit = db.isLeagueInFavourite(leagueId: selectedLeague!.leagueId)
        
        let leagueDetailsPresenter = LeagueDetailsPresenter(leagueDetailDelegate: self)
        //upcoming
        leagueDetailsPresenter.fetchUpcomingEvent(_leagueId: selectedLeague!.leagueId, _url: Const.UPCOMING_EVENT)
        
        //latest Result
        leagueDetailsPresenter.fetchLatestResult(_leagueId: selectedLeague!.leagueId, _url: Const.LATEST_RESULT)
        
        //all League Team
        leagueDetailsPresenter.fetchTeamDetails(_leagueId: selectedLeague!.leagueId, _url: Const.TEAMS_DETAILS)
        
        //register upcoming cell
        upcomingCollectionView.register(UINib(nibName: "UpcomingCell", bundle: nil), forCellWithReuseIdentifier: "upcomingCell")
        
        
        //register latest cell
        latestCollectionView.register(UINib(nibName: "LatestResultCell", bundle: nil), forCellWithReuseIdentifier: "latestCell")
        
        
        //register team cell
        teamCollectionView.register(UINib(nibName: "teamCell", bundle: nil), forCellWithReuseIdentifier: "teamCell")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navBar.topItem?.title = selectedLeague?.strLeague
        setUpFavicon(isFavourite: isFavourit)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if isFavourit {
            db.insertFavouruteLeuge(delegate:self , league: selectedLeague!)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == upcomingCollectionView) {
            return upcomingEvents.count
        }else if (collectionView == latestCollectionView) {
            return latestResult.count
        }
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == teamCollectionView {
            print("tema selected \(indexPath.row)")
            let storyboard = UIStoryboard(name: "TeamDetailsStoryboard",bundle:nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "teamid") as! TeamDetailsViewController
            viewController.idTeam = teams[indexPath.row].teamId
            present(viewController, animated: true, completion: nil)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == upcomingCollectionView ){
           
            let event = upcomingEvents[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as! UpcomingCell
            cell.setCell(event: event)
            return cell
        
        }else if (collectionView == latestCollectionView){
            
            let event = latestResult[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestCell", for: indexPath) as! LatestResultCell
            cell.setCell(event: event)
            return cell
            
        }else {
            
            let team = teams[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! teamCell
            let teamBadgeUrl = URL(string:team.teamBadge.appending("/preview"))
            cell.teamBadge.kf.setImage(with: teamBadgeUrl, placeholder: UIImage(named: "placeHolder-1"))
            
            return cell
        }
    }
    
    func fetchedUpcomingEventData(events: [Event]) {
        upcomingEvents = events
        if events.count>0{
            self.upcomingCollectionView.reloadData()
        }else {
            noUpcomingImage.isHidden = false
        }
    }

    func fetchedLatestResultData(events: [Event]) {
        latestResult = events
        if(events.count>0){
        latestCollectionView.reloadData()
        }else {
            noLatestImage.isHidden = false
        }
    }
    
    func fetchedTeamDetails(teams: [Team]) {
        self.teams = teams
        upcomingEvents = Extracter.getTeamsBadges2(events: upcomingEvents, teams: teams)
        latestResult = Extracter.getTeamsBadges2(events: latestResult, teams: teams)
        upcomingCollectionView.reloadData()
        
        latestCollectionView.reloadData()
        teamCollectionView.reloadData()
    }
    
    func error(result:Result,message: String) {
        print(message)
    }

    
    
    //attach collectionViews to leaguesDetailsView delegate
    func attachDelegate (){
        //upcoming
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        
        //latest
        latestCollectionView.dataSource = self
        latestCollectionView.delegate = self
        
        //teams
        
        teamCollectionView.dataSource = self
        teamCollectionView.delegate = self
    }
    
    
    func setUpFavicon (isFavourite:Bool) {
        if isFavourite {
            addToFav.setImage(fillIcon, for: .normal)
        }
    }
    //TODO: remove delegate func when remove delegate param from insert func
    func fetchedFavouriteLeuges(leuges: [League]) {
        
    }
    
    func error(message: String) {
        
    }
    
    //configure collectionViews autosize
    func setUpCollectionViewsSizeConfiguration(){
        let layout = upcomingCollectionView.collectionViewLayout
           if let flowLayout = layout as? UICollectionViewFlowLayout {
               flowLayout.estimatedItemSize = CGSize(
                   width: upcomingCollectionView.widestCellWidth,
                   // Make the height a reasonable estimate to
                   // ensure the scroll bar remains smooth
                   height: 180
               )
           }
    }
}
