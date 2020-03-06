//
//  NotificationOnOffController.swift
//  livetrivia
//
//  Created by macbook on 27/12/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit
import FirebaseAuth

class NotificationOnOffController: BaseController {

    //MARK:- OUTLETS
    @IBOutlet weak var triviaView: UIView!
    @IBOutlet weak var triviaButton: UIButton!
    @IBOutlet weak var wordsView: UIView!
    @IBOutlet weak var wordsButton: UIButton!
    @IBOutlet weak var sportsView: UIView!
    @IBOutlet weak var sportsButton: UIButton!
    
    
    var userData = [String]()
    
    //MARK:- PROPERTIES
     var isTriviaChecked: Bool = false {
         didSet{
             if isTriviaChecked == true {
                self.triviaButton.setImage(UIImage(named: "toggle_on"), for: UIControl.State.normal)
             } else {
                self.triviaButton.setImage(UIImage(named: "toggle_off"), for: UIControl.State.normal)
             }
         }
     }
    
    var isWordsChecked: Bool = false {
        didSet{
            if isWordsChecked == true {
                self.wordsButton.setImage(UIImage(named: "toggle_on"), for: UIControl.State.normal)
            } else {
                self.wordsButton.setImage(UIImage(named: "toggle_off"), for: UIControl.State.normal)
            }
        }
    }
    
    var isSportsChecked: Bool = false {
        didSet{
            if isSportsChecked == true {
                self.sportsButton.setImage(UIImage(named: "toggle_on"), for: UIControl.State.normal)
            } else {
                self.sportsButton.setImage(UIImage(named: "toggle_off"), for: UIControl.State.normal)
            }
        }
    }
    
    
    //MARK:- VC LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        
        
    }
    
    
    
}


extension NotificationOnOffController {
    func setupUI() {
        
        //addRoundNextButton(viewController: self)
        addNextButton()
        
        triviaView.roundedCorners()
        wordsView.roundedCorners()
        sportsView.roundedCorners()

    
        
        triviaButton.addTarget(self, action: #selector(changeTriviaStatus), for: .touchUpInside)
        wordsButton.addTarget(self, action: #selector(changeWordsStatus), for: .touchUpInside)
        sportsButton.addTarget(self, action: #selector(changeSportsStatus), for: .touchUpInside)
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
    
    func addNextButton() {
         let btn = UIButton()
         let image = UIImage(named: "next_btn")
         btn.setImage(image, for: .normal)
         btn.addTarget(self, action: #selector(createNewUser), for: .touchUpInside)
         btn.frame = CGRect(x: 0, y: 0, width: 105, height: 44)
         let bbi = UIBarButtonItem(customView: btn)
         self.navigationItem.rightBarButtonItem = bbi
    }
    
    @objc func createNewUser() {
        
        BaseController.showHud(self.view)
        
        if userData.count < 2 {
            return
        }
        
          let data = ["id": FirestoreHelper.users.document().documentID,
                      "phoneNumber": Auth.auth().currentUser?.phoneNumber!,
                      "username": userData[0],
                      "referralCode": userData[1],
                      "imageUrl": "",
              ] as [String : Any]
                      
          FirestoreUser.createWith(data: data).done { firestoreuser in
          FirestoreUser.shared = firestoreuser
          
          UserDefaults.standard.set(FirestoreHelper.users.document().documentID, forKey: "id")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                BaseController.hideHud(self.view)
                self.pushTabBarVC()
            }
          
       }
    }
}
