//
//  CodeRecievedController.swift
//  livetrivia
//
//  Created by macbook on 26/12/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class CodeRecievedController: BaseController {
    
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var resendButton: UIButton!
    @IBOutlet weak var loginLogoHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    @IBAction func onNextTapped(_ sender: Any) {
        
        BaseController.showHud(self.view)
        signInUsingPhoneCode { [weak self] (status) in
            guard let weak = self else {return}
            if status {
                BaseController.hideHud(weak.view)
                weak.pushVC(name: Commons.STORYBOARD_ID_CREATE_PROFILE)
                
            } else {
                 BaseController.hideHud(weak.view)
                 print("Something went wrong")
            }
            
        }
    }
    
}


extension CodeRecievedController {
    func setupUI() {
    
        addBlackPlusButton(viewController: self)
        
        codeTextField.roundedCorners()
        nextButton.roundedCorners()
        
        let h = getDeviceHeight()
        if h == 667.0 {
            loginLogoHeightConstraint.constant = 155
        } else {
            loginLogoHeightConstraint.constant = 188
        }
    }
}
