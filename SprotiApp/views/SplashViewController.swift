//
//  SplashViewController.swift
//  SprotiApp
//
//  Created by Ashraf on 4/23/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import UIKit
class SplashViewController: UIViewController {

    
    @IBOutlet weak var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {[unowned self] in
            self.animationView.animation = Animation.named("splash")
            self.animationView.loopMode = .loop
            self.animationView.play()
        }
        performSegue(withIdentifier: "next", sender: nil)
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
