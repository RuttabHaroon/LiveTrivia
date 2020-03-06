//
//  PrizesController.swift
//  livetrivia
//
//  Created by macbook on 07/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class PrizesController: BaseController {
    
    @IBOutlet weak var thisWeekButton: UIButton!
    @IBOutlet weak var allTimeButton: UIButton!
    @IBOutlet weak var firstPrizeImageView: UIImageView!
    @IBOutlet weak var secondPrizeImageView: UIImageView!
    @IBOutlet weak var thirdPrizeImageView: UIImageView!
    @IBOutlet weak var prizesTableView: UITableView!
    @IBOutlet weak var dashedLineView: UIView!
    @IBOutlet weak var secondDashedLineView: UIView!
    @IBOutlet weak var firstPrizeTotalAmountLabel: UIView!
    @IBOutlet weak var secondPrizeTotalAmountLabel: UIView!
    @IBOutlet weak var thirdPrizeTotalAmountLabel: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dashedLineViewTrailingConstraint: NSLayoutConstraint!
    
    
    var prizes = ["Tickets","Sneakers", "Watch", "Tickets","Sneakers", "Watch","Sneakers"]
    var rank = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupUI()
    }
    
}

extension PrizesController {
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
        createDottedLine(x0: dashedLineView.bounds.minX, y0: dashedLineView.bounds.minY,x1: dashedLineView.bounds.maxX, y1: dashedLineView.bounds.maxY, width: 2, color: UIColor(red: 115/255, green: 183/255, blue: 229/255, alpha: 1), view: dashedLineView)
        
        secondDashedLineView.backgroundColor = UIColor.clear
         createDottedLine(x0: secondDashedLineView.bounds.minX, y0: secondDashedLineView.bounds.minY,x1: secondDashedLineView.bounds.maxX, y1: secondDashedLineView.bounds.maxY, width: 2, color: UIColor(red: 115/255, green: 183/255, blue: 229/255, alpha: 1), view: secondDashedLineView)
        
        
        firstPrizeImageView.roundView()
        secondPrizeImageView.roundView()
        thirdPrizeImageView.roundView()
        
        firstPrizeTotalAmountLabel.roundedCorners()
        secondPrizeTotalAmountLabel.roundedCorners()
        thirdPrizeTotalAmountLabel.roundedCorners()
        
        
        prizesTableView.separatorStyle = .none
        prizesTableView.backgroundColor = UIColor.clear
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

extension PrizesController: UITableViewDataSource, UITableViewDelegate {
    
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
          
          if rank > 11 {
              rank = rank + 1
          } else {
              rank = 3
          }
        
          let rankString = String(rank)
          winnerCell.setUp(name: prize, currentRank: rankString)
               
          return winnerCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
}
