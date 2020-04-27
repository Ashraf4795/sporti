//
//  SplashViewController.swift
//  SprotiApp
//
//  Created by Ashraf on 4/23/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {

        
    @IBOutlet var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabBarVC = self.storyboard?.instantiateViewController(withIdentifier: "tabBar") as! TabBarController
        
        self.animationView.animation = Animation.named("splash")
        self.animationView.loopMode = .repeat(3)
        self.animationView.play()
        self.animationView.play(completion: { [weak self]boolVal in
            guard let self = self else {return}
            tabBarVC.modalPresentationStyle = .fullScreen
                   self.present(tabBarVC, animated: true, completion: nil)
            
        })
        
       
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
