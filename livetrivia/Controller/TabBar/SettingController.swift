//
//  SettingController.swift
//  livetrivia
//
//  Created by macbook on 27/12/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class SettingController: BaseController {

    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var notificationsView: UIView!
    @IBOutlet weak var dashedLineView: UIView!
    @IBOutlet weak var triviaButton: UIButton!
    @IBOutlet weak var wordsButton: UIButton!
    @IBOutlet weak var sportsButton: UIButton!
    @IBOutlet weak var discoverableNearbyButton: UIButton!
    
    @IBOutlet weak var dashedLineViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoutButton: UIButton!
    
    
    
    var isTriviaChecked: Bool = false {
         didSet{
             if isTriviaChecked == true {
                self.triviaButton.setImage(UIImage(named: "toggle_on-1"), for: UIControl.State.normal)
             } else {
                self.triviaButton.setImage(UIImage(named: "toggle_off"), for: UIControl.State.normal)
             }
         }
     }
    
    var isWordsChecked: Bool = false {
        didSet{
            if isWordsChecked == true {
                self.wordsButton.setImage(UIImage(named: "toggle_on-1"), for: UIControl.State.normal)
            } else {
                self.wordsButton.setImage(UIImage(named: "toggle_off"), for: UIControl.State.normal)
            }
        }
    }
    
    var isSportsChecked: Bool = false {
        didSet{
            if isSportsChecked == true {
                self.sportsButton.setImage(UIImage(named: "toggle_on-1"), for: UIControl.State.normal)
            } else {
                self.sportsButton.setImage(UIImage(named: "toggle_off"), for: UIControl.State.normal)
            }
        }
    }
    
    var isDiscoverableChecked: Bool = false {
        didSet{
            if isDiscoverableChecked == true {
                self.discoverableNearbyButton.setImage(UIImage(named: "toggle_on-1"), for: UIControl.State.normal)
            } else {
                self.discoverableNearbyButton.setImage(UIImage(named: "toggle_off"), for: UIControl.State.normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    
    @IBAction func onLogoutTapped(_ sender: Any) {
        logOut()
    }
    
}


extension SettingController {
    func setupUI() {
        
        profilePictureImageView.roundView()
        notificationsView.applyCornerRadius(cornerRadius: 12)
        
        dashedLineView.backgroundColor = UIColor.clear
        createDottedLine(x0: dashedLineView.bounds.minX, y0: dashedLineView.bounds.minY,x1: dashedLineView.bounds.maxX, y1: dashedLineView.bounds.maxY, width: 2, color: UIColor(red: 115/255, green: 183/255, blue: 229/255, alpha: 1), view: dashedLineView)
        
        
        if getDeviceDimensions().0 == 414 {
            dashedLineViewTrailingConstraint.constant = 9
        } else {
            dashedLineViewTrailingConstraint.constant = 16
        }
        
        triviaButton.addTarget(self, action: #selector(changeTriviaStatus), for: .touchUpInside)
        wordsButton.addTarget(self, action: #selector(changeWordsStatus), for: .touchUpInside)
        sportsButton.addTarget(self, action: #selector(changeSportsStatus), for: .touchUpInside)
        discoverableNearbyButton.addTarget(self, action: #selector(changeDiscoverableStatus), for: .touchUpInside)
    }
    
    @objc func changeTriviaStatus() {
        
          if isTriviaChecked {
              isTriviaChecked = false
          } else {
              isTriviaChecked = true
          }
      }
      
    @objc func changeWordsStatus() {
          if isWordsChecked {
              isWordsChecked = false
          } else {
              isWordsChecked = true
          }
    }
      
    @objc func changeSportsStatus() {
          if isSportsChecked {
              isSportsChecked = false
          } else {
              isSportsChecked = true
          }
    }
    
    @objc func changeDiscoverableStatus() {
          if isDiscoverableChecked {
              isDiscoverableChecked = false
          } else {
              isDiscoverableChecked = true
          }
    }
    

    
}
