//
//  CardCell.swift
//  livetrivia
//
//  Created by macbook on 10/02/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    func setUpUI(img: UIImage)
    {
        let imageView = self.viewWithTag(2) as? UIImageView
        imageView?.image = img
              
                  
        self.addDropShadow(shadowColor: UIColor(red:0.75, green:0.85, blue:0.95, alpha:1.0), shadowOpacity: 0.25, shadowRadius: 1.0)
    }
    
}
