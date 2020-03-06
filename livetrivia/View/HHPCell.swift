//
//  HHPCell.swift
//  livetrivia
//
//  Created by macbook on 07/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class HHPCell: UITableViewCell {
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var hostShowimageView: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var shareButtonLeadingConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    func setup(imgString: String, index: Int) {
        
        
        containerView.applyCornerRadius(cornerRadius: 12)
        hostShowimageView.image = UIImage(named: imgString)
        
        shareButton.roundedCorners()
        
        if index % 2 == 0 {
            self.dateTimeLabel.textColor = UIColor.black
        } else {
            self.dateTimeLabel.textColor = UIColor.white
        }
                
        var title = ""
        if index == 0 {
            title = "LIVE"
        } else if index == 1 {
            title = "KNOCKOUT!"
        } else if index == 2 {
            title = "COUNTDOWN!"
        } else {
            title = "NEXTUP!"
        }
        shareButton.accessibilityLabel = title
       
        shareButton.addTarget(self, action: #selector(onShareTapped), for: .touchUpInside)

    }
      
}
