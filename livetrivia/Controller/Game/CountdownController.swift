//
//  CountdownController.swift
//  livetrivia
//
//  Created by macbook on 21/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class CountdownController: BaseController {

    @IBOutlet weak var nextUpUsersContainerView: UIView!
    @IBOutlet weak var firstUserProfilePicture: UIImageView!
    @IBOutlet weak var secondUserProfilePicture: UIImageView!
    @IBOutlet weak var thirdUserProfilePicture: UIImageView!
    @IBOutlet weak var leftArrowBodyView: ShapedView!
    @IBOutlet weak var rightArrowBodyView: ShapedView!
    @IBOutlet weak var middleTimerView: ShapedView!
    @IBOutlet weak var nextupUsersTableView: UITableView!
    @IBOutlet weak var dashLineView: UIView!
    @IBOutlet weak var firstPrizeNameLabel: UILabel!
    @IBOutlet weak var firstPrizeAmountLabel: UILabel!
    @IBOutlet weak var firstPrizeImageView: UIImageView!
    @IBOutlet weak var secondPrizeNameLabel: UILabel!
    @IBOutlet weak var secondPrizeAmountLabel: UILabel!
    @IBOutlet weak var secondPrizeImageView: UIImageView!
    @IBOutlet weak var thirdPrizeNameLabel: UILabel!
    @IBOutlet weak var thirdPrizeAmountLabel: UILabel!
    @IBOutlet weak var thirdPrizeImageView: UIImageView!
    @IBOutlet weak var firstPersonCountryImageView: UIImageView!
    @IBOutlet weak var firstPersonScoreLabel: UILabel!
    @IBOutlet weak var secondPersonCountryImageView: UIImageView!
    @IBOutlet weak var secondPersonScoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    var prizes = ["Tickets","Sneakers", "Watch", "Tickets","Sneakers", "Watch","Sneakers"]
    var rank = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
       
    }
    

    func setupUI() {

       // secondPersonCountryImageView.roundView()
        //firstPersonCountryImageView.roundView()
        
        firstPrizeImageView.roundView()
        secondPrizeImageView.roundView()
        thirdPrizeImageView.roundView()
        
        firstPrizeAmountLabel.roundedCorners()
        secondPrizeAmountLabel.roundedCorners()
        thirdPrizeAmountLabel.roundedCorners()
        
        nextUpUsersContainerView.applyCornerRadius(cornerRadius: 12)
        firstUserProfilePicture.applyCornerRadius(cornerRadius: 12, true)
        secondUserProfilePicture.applyCornerRadius(cornerRadius: 12, true)
        thirdUserProfilePicture.applyCornerRadius(cornerRadius: 12, true)
           
        //setUpLeftScoreArrow()
        //setUpRightScoreArrow()
        //setUpMidleTimerView()
        
        dashLineView.backgroundColor = UIColor.clear
        createDottedLine(x0: dashLineView.bounds.minX, y0: dashLineView.bounds.minY,x1: dashLineView.bounds.maxX, y1: dashLineView.bounds.maxY, width: 2, color: UIColor(red: 115/255, green: 183/255, blue: 229/255, alpha: 1), view: dashLineView)
        
    }
    
    func setUpLeftScoreArrow() {
        leftArrowBodyView.backgroundColor = UIColor.clear
        let p = UIBezierPath(roundedRect: leftArrowBodyView.bounds,
                             byRoundingCorners: [.topLeft, .bottomLeft],
                             cornerRadii: CGSize(width: leftArrowBodyView.frame.size.height / 2,
                                                 height: leftArrowBodyView.bounds.height))
        let maskLayer = CAShapeLayer()
        maskLayer.path = p.cgPath
        leftArrowBodyView.layer.mask = maskLayer
        
        firstPersonScoreLabel.addDropShadow(shadowColor:UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0), shadowOpacity: 0.8
        , shadowRadius: 25)
        secondPersonScoreLabel.layer.masksToBounds = true
        
        leftArrowBodyView.addDropShadow(shadowColor: UIColor.black,
                                        shadowOpacity: 0.4
                                        ,shadowRadius: 5)
    }
    
    func setUpRightScoreArrow() {
        rightArrowBodyView.backgroundColor = UIColor.clear
        let p = UIBezierPath(roundedRect: rightArrowBodyView.bounds,
                             byRoundingCorners: [.topLeft, .bottomLeft],
                             cornerRadii: CGSize(width: rightArrowBodyView.frame.size.height / 2,
                                                 height: rightArrowBodyView.bounds.height))
        let maskLayer = CAShapeLayer()
        maskLayer.path = p.cgPath
        rightArrowBodyView.layer.mask = maskLayer
        
        secondPersonScoreLabel.transform = rightArrowBodyView.transform.rotated(by: .pi)
        
        rightArrowBodyView.transform = rightArrowBodyView.transform.rotated(by: .pi)
        
        secondPersonScoreLabel.addDropShadow(shadowColor:UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0), shadowOpacity: 0.8
        , shadowRadius: 25)
        secondPersonScoreLabel.layer.masksToBounds = true
        
        rightArrowBodyView.addDropShadow(shadowColor: UIColor.black, shadowOpacity: 0.4
        , shadowRadius: 5)
    }
    
    func setUpMidleTimerView() {
        self.middleTimerView.backgroundColor = UIColor.white.withAlphaComponent(0.61)
        self.middleTimerView.roundedCorners()
        
        //UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
        timerLabel.addDropShadow(shadowColor:UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0), shadowOpacity: 0.8
        , shadowRadius: 25)
        timerLabel.layer.masksToBounds = true
        
        middleTimerView.addDropShadow(shadowColor: UIColor.black, shadowOpacity: 0.4
        , shadowRadius: 5)
        
    }
}

extension CountdownController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prizes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let winnerCell = tableView.dequeueReusableCell(withIdentifier: "winnerCell", for: indexPath) as? WinnerCell else {
                   fatalError("The dequeued cell is not of type WinnerCell")
               }
               
          let prize = prizes[indexPath.item]

          rank = rank + 1
          let rankString = String(rank)
          winnerCell.setUp(name: prize, currentRank: rankString)
               
          return winnerCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
}
