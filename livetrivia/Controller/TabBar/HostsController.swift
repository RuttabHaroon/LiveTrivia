//
//  HostsController.swift
//  livetrivia
//
//  Created by macbook on 06/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class HostsController: BaseController {

    
    @IBOutlet weak var thisWeekButton: UIButton!
    @IBOutlet weak var allTimeButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dashedLineView: UIView!
    @IBOutlet weak var dashedLineViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondDashedLineView: UIView!
    @IBOutlet weak var firstUserImageView: UIImageView!
    @IBOutlet weak var firstUserTotalAmountLabel: UILabel!
    @IBOutlet weak var secondUserImageView: UIImageView!
    @IBOutlet weak var secondUserTotalAmountLabel: UILabel!
    @IBOutlet weak var thirdUserImageView: UIImageView!
    @IBOutlet weak var thirdUserTotalAmountLabel: UILabel!
    @IBOutlet weak var usersTableView: UITableView!
    
    
    var usernames = ["peelofshame","saridy991", "norm989", "player866", "player 545", "androiddev12","icloudDev22"]
    var rank = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

}

extension HostsController {

    func setupUI() {
       thisWeekButton.roundedCorners()
        allTimeButton.roundedCorners()

        thisWeekButton.addTarget(self, action: #selector(changeButtonAppearance(sender:)), for: .touchUpInside)
        allTimeButton.addTarget(self, action: #selector(changeButtonAppearance(sender:)), for: .touchUpInside)

        thisWeekButton.backgroundColor = UIColor(red: 225/255, green: 105/255, blue: 166/255, alpha: 1)
        thisWeekButton.addDropShadow(shadowColor: UIColor.gray, shadowOpacity: 0.55, shadowRadius: 10)

        allTimeButton.backgroundColor = UIColor.clear
        allTimeButton.layer.shadowOpacity = 0

        
        containerView.roundedCorners()

        dashedLineView.backgroundColor = UIColor.clear
        
        if UIScreen.main.bounds.size.width == 414 {
            dashedLineViewTrailingConstraint.constant = 0
        } else {
            dashedLineViewTrailingConstraint.constant = 16
        }

        createDottedLine(x0: dashedLineView.bounds.minX, y0: dashedLineView.bounds.minY,x1: dashedLineView.bounds.maxX, y1: dashedLineView.bounds.maxY, width: 2, color: UIColor(red: 115/255, green: 183/255, blue: 229/255, alpha: 1), view: dashedLineView)
            
        
        secondDashedLineView.backgroundColor = UIColor.clear
        createDottedLine(x0: secondDashedLineView.bounds.minX, y0: secondDashedLineView.bounds.minY,x1: secondDashedLineView.bounds.size.width, y1: secondDashedLineView.bounds.maxY, width: 2, color: UIColor(red: 115/255, green: 183/255, blue: 229/255, alpha: 1), view: secondDashedLineView)
        
        
        firstUserImageView.roundView()
        secondUserImageView.roundView()
        thirdUserImageView.roundView()
        
        firstUserTotalAmountLabel.roundedCorners()
        secondUserTotalAmountLabel.roundedCorners()
        thirdUserTotalAmountLabel.roundedCorners()
        
        
        usersTableView.separatorStyle = .none
        usersTableView.backgroundColor = UIColor.clear
        

        
    }

    @objc func changeButtonAppearance(sender: Any){
        if let senderButton = sender as? UIButton {
            if senderButton == thisWeekButton {
                print("weekk")
                thisWeekButton.backgroundColor = UIColor(red: 225/255, green: 105/255, blue: 166/255, alpha: 1)
                thisWeekButton.addDropShadow(shadowColor: UIColor.gray, shadowOpacity: 0.55, shadowRadius: 10)

                allTimeButton.backgroundColor = UIColor.clear
                allTimeButton.layer.shadowOpacity = 0


                let allTimeButtonttributedString = NSMutableAttributedString(string: allTimeButton.titleLabel?.text ?? "")
                allTimeButtonttributedString.addAttributes([NSAttributedString.Key.font: UIFont(name: "FuturaPT-Medium", size: 17)], range: NSRange(location: 0, length: allTimeButton.titleLabel?.text?.count ?? 0))
                allTimeButtonttributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor(red:0.75, green:0.85, blue:0.95, alpha:1.0)], range: NSRange(location: 0, length: allTimeButton.titleLabel?.text?.count ?? 0))
                allTimeButton.titleLabel?.attributedText = allTimeButtonttributedString

            } else {
                thisWeekButton.backgroundColor = UIColor.clear
                thisWeekButton.layer.shadowOpacity = 0

                let thisWeekAttributedString = NSMutableAttributedString(string: thisWeekButton.titleLabel?.text ?? "")
               thisWeekAttributedString.addAttributes([NSAttributedString.Key.font: UIFont(name: "FuturaPT-Medium", size: 17)], range: NSRange(location: 0, length: thisWeekButton.titleLabel?.text?.count ?? 0))
               thisWeekAttributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor(red:0.75, green:0.85, blue:0.95, alpha:1.0)], range: NSRange(location: 0, length: thisWeekButton.titleLabel?.text?.count ?? 0))
               thisWeekButton.titleLabel?.attributedText = thisWeekAttributedString

                allTimeButton.backgroundColor = UIColor(red: 225/255, green: 105/255, blue: 166/255, alpha: 1)
                
                allTimeButton.setTitleColor(UIColor.white, for: .normal)
                allTimeButton.addDropShadow(shadowColor: UIColor.gray, shadowOpacity: 0.60, shadowRadius: 10)

            }
        }
    }
}

extension HostsController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usernames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let winnerCell = tableView.dequeueReusableCell(withIdentifier: "winnerCell", for: indexPath) as? WinnerCell else {
            fatalError("The dequeued cell is not of type WinnerCell")
        }
        
        let name = usernames[indexPath.item]
        
        rank = rank + 1
        let rankString = String(rank)
        winnerCell.setUp(name: name, currentRank: rankString)
        
        return winnerCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
}
