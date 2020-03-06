//
//  RejectedPopUpController.swift
//  livetrivia
//
//  Created by macbook on 21/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit
import SwiftEntryKit

class RejectedPopUpController : BaseController {
    
    @IBOutlet weak var inviteButton: UIButton!
    @IBOutlet weak var detailView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.inviteButton.roundedCorners()
        
        detailView.layer.borderColor = UIColor(red:0.75, green:0.85, blue:0.95, alpha:1.0).cgColor
        detailView.layer.borderWidth = 1.5
        detailView.applyCornerRadius(cornerRadius: 26)
    }
    
    @IBAction func onCrossButtonTapped(_ sender: Any) {
        print("CROSS TAPPED")
        SwiftEntryKit.dismiss()
    }
    
    @IBAction func onInviteTapped(_ sender: Any) {
        print("INVITE TAPPED")
        SwiftEntryKit.dismiss()
    }
    
}
