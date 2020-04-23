//
//  TabBarController.swift
//  tabBarDemo
//
//  Created by saraMohamed on 4/22/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        var arrayOfImageNameForUnselectedState :[UIImage] = []
        arrayOfImageNameForUnselectedState.append(UIImage(named:"unselectedstar.png")!)
        arrayOfImageNameForUnselectedState.append(UIImage(named:"unselectedsport.png")!)
        
        if let count = self.tabBar.items?.count {
            for i in 0...(count-1) {
             
                let imageNameForUnselectedState = arrayOfImageNameForUnselectedState[i]
                self.tabBar.items?[i].title = ""
        
                self.tabBar.items?[i].image =  imageNameForUnselectedState
            }
        }
        
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
