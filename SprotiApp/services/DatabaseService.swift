//
//  DatabaseService.swift
//  SprotiApp
//
//  Created by Ashraf on 4/18/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class DatabaseService : DatabaseServiceProtocol{
  
    /*sara*/
    var appDelegate  : AppDelegate
    var managedContext :  NSManagedObjectContext
    let entity : NSEntityDescription?
    
    static let INSTANCE:DatabaseServiceProtocol = DatabaseService()
    init() {
        appDelegate = UIApplication.shared.delegate as! AppDelegate
         managedContext = appDelegate.persistentContainer.viewContext
         entity = NSEntityDescription.entity(forEntityName: "LeagueEntity", in: managedContext)
      
    }
    func fetchAllFavouriteLeuges(delegate: FavouriteLeugesDelegate) {
        var favouriteLeuges:[NSManagedObject] = []
        var favouriteLeugesArray:[League] = []

        let fetchRequest = NSFetchRequest<NSManagedObject> (entityName: "LeagueEntity")
        do{
            favouriteLeuges = try managedContext.fetch(fetchRequest)
        }catch let error as NSError{
            print(error)
        }
        for leuge in favouriteLeuges
        {
            var leugeObj = League(leagueId: leuge.value(forKey: "leagueId") as! Int, strLeague: leuge.value(forKey: "strLeague") as! String, strCountry: leuge.value(forKey: "strCountry") as! String, strBadge: leuge.value(forKey: "strBadge") as! String, strYoutube: leuge.value(forKey: "strYoutube") as! String)
            favouriteLeugesArray.append(leugeObj)
        }
        delegate.fetchedFavouriteLeuges(leuges:favouriteLeugesArray)

    }
    
   
    
    func insertFavouruteLeuge(delegate: FavouriteLeugesDelegate , league : League) {
        let favoutiteLeague = NSManagedObject(entity: entity!, insertInto: managedContext)
        favoutiteLeague.setValue(Int(league.leagueId), forKey: "leagueId")
        favoutiteLeague.setValue(league.strLeague, forKey: "strLeague")
        favoutiteLeague.setValue(league.strCountry, forKey: "strCountry")
        favoutiteLeague.setValue(league.strBadge, forKey: "strBadge")
        favoutiteLeague.setValue(league.strYoutube, forKey: "strYoutube")
        do
        {
            try managedContext.save()
            print("saved")
            
        }catch let error as NSError{
            print(error)
        }
    }
    /*sara*/
    
    /*Ashraf*/
    /*Ashraf*/
}
