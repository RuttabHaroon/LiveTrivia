//
//  CardInformationCell.swift
//  livetrivia
//
//  Created by macbook on 10/02/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class CardInformationCell: UITableViewCell {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var rightButton: UIButton!
    
    
    func setUpUI(placeholder: String, index: Int) {
        
        self.textField.setLeftPaddingPoints(20)
        
        textField.layer.borderColor = UIColor(red:0.75, green:0.85, blue:0.95, alpha:1.0).cgColor
        textField.layer.borderWidth = 1
        textField.roundedCorners()
        
        textField.placeholder = placeholder
        
        if index == 2 {
            
            rightButton.setImage( UIImage(named: "calendar"), for: .normal)
            rightButton.addTarget(self, action: #selector(openCalendar), for: .touchUpInside)
            rightButton.isHidden = false
        }
        else if index == 3  {
            rightButton.setImage( UIImage(named: "arrow"), for: .normal)
            rightButton.isHidden = false
        }
        else {
            rightButton.imageView?.image = UIImage(named: "")
            rightButton.addTarget(self, action: #selector(openDropDown), for: .touchUpInside)
            rightButton.isHidden = true
        }
        
    }
    
    @objc func openCalendar() {
        
    }
    
    @objc func openDropDown() {
        
    }
    
}
