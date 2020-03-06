//
//  YouWonPopupController.swift
//  livetrivia
//
//  Created by macbook on 03/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class YouWonPopupController: BaseController {

    @IBOutlet weak var thanksButton: UIButton!
       
       @IBOutlet weak var youWonImageHeightConstraint: NSLayoutConstraint!
       @IBOutlet weak var titleTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

}


extension YouWonPopupController {
    
    func setupUI() {
        
        addWhiteCrossButton(viewController: self)
        
        thanksButton.roundedCorners()
        
        let h = getDeviceHeight()
        if h == 667.0 {
            youWonImageHeightConstraint.constant = 195
            titleTopConstraint.constant = 90
        } else {
            youWonImageHeightConstraint.constant = 363
            titleTopConstraint.constant = 12
        }
    }
}
