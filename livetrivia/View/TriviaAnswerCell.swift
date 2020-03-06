//
//  TriviaAnswerCell.swift
//  livetrivia
//
//  Created by macbook on 20/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit


class TriviaAnswerCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    
    func setUp(answer: String) {
        
        containerView.layer.borderColor = UIColor(red:0.75, green:0.85, blue:0.95, alpha:1.0).cgColor
        containerView.layer.borderWidth = 2.0
        //containerView.backgroundColor = UIColor(red: 190/255, green: 216/255, blue: 241/255, alpha: 1.0)
        containerView.roundedCorners()
        
        
        questionLabel.text = answer
    }
    
}
