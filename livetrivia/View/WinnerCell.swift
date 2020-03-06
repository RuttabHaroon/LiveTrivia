//
//  WinnerCell.swift
//  livetrivia
//
//  Created by macbook on 06/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class WinnerCell: UITableViewCell {

    var usernames = ["peelofshame","saridy991", "norm989", "player866", "player 545", "androiddev12","icloudDev22"]
    
     //var prizes = ["Tickets","Sneakers", "Watch", "Tickets","Sneakers", "Watch","Sneakers"]
    
    @IBOutlet weak var winnerProfileImageView: UIImageView!
    @IBOutlet weak var winnerNameLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var winnerContainerView: UIView!
    @IBOutlet weak var rankNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func setUp(name: String, currentRank: String) {
        winnerProfileImageView.roundView()
        winnerNameLabel.text = name //"peelofshame"
        totalAmountLabel.roundedCorners()
        
        totalAmountLabel.layer.borderColor = UIColor(red:0.75, green:0.85, blue:0.95, alpha:1.0).cgColor
        totalAmountLabel.layer.borderWidth = 1
        
        winnerContainerView.backgroundColor = UIColor.white
        winnerContainerView.applyCornerRadius(cornerRadius: 12)
        
        topContainerView.backgroundColor = UIColor.clear
        
        rankNumberLabel.text = currentRank
        
        //rankNumberLabel.text = "\(index + 1)"
        
//        if name == "peelofshame" || name == "Tickets "{
//            rankNumberLabel.text = "4th"
//
//        } else  if name == "saridy991" || name == "Sneakers" {
//            rankNumberLabel.text = "5th"
//
//        } else  if name == "norm989" || name == "Watch" {
//                   rankNumberLabel.text = "6th"
//
//        } else  if name == "player866" || name == "Tickets" {
//                rankNumberLabel.text = "7th"
//
//        } else  if name == "player 545" || name == "Sneakers" {
//                   rankNumberLabel.text = "8th"
//
//        } else  if name == "androiddev12" || name == "Watch" {
//                   rankNumberLabel.text = "9th"
//        } else {
//            rankNumberLabel.text = "10th"
//        }
        
    }

}
