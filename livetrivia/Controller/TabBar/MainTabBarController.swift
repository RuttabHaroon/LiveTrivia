//
//  MainTabBarController.swift
//  livetrivia
//
//  Created by macbook on 22/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit


class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectedIndex = 2
            
//        if let topVC = self.moreNavigationController.topViewController as? UIViewController {
//            //topVC.view.backgroundColor = UIColor.yellow
//
//            let imgVw = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
//            let img = UIImage(named: "bg")
//            imgVw.image = img
//            //self.moreNavigationController.topViewController?.view.addSubview(imgVw)
//
//            self.moreNavigationController.view.addSubview(imgVw)
//            self.moreNavigationController.view.sendSubviewToBack(imgVw)
//        }

        
    }
    
}
