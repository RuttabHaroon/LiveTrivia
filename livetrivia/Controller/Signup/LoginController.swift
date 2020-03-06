//
//  ViewController.swift
//  livetrivia
//
//  Created by macbook on 25/12/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit
import CountryPickerView
import SwiftEntryKit


class LoginController: BaseController {

    
    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var countryPickerView: CountryPickerView!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var loginLogoHeightConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()
        

    }

    @IBAction func onLoginTapped(_ sender: Any) {
        
        
        
       if let phoneNumber = phoneNumberTextField.text {
        
            //temp will be deleted later
            let tempNo = "+1 650-555-3434"
            UserDefaults.standard.set("123456", forKey: "authVerificationCode")
            //temp will be deleted later
        
            userAuthenticationViaPhoneNumber(phoneNumber: tempNo) { [weak self] (status) in
                guard let weakself = self else {return}
                if status {
                    weakself.pushVC(name: Commons.STORYBOARD_ID_CODE_RECIEVED)
                }
            }
        }
    }
}


extension LoginController {
    
    func setupUI() {
        
        
        phoneNumberView.roundedCorners()
        loginButton.roundedCorners()
        
        countryPickerView.showCountryCodeInView = false
        
        countryPickerView.font = UIFont.futuraPTDemi(size: 25)
        countryPickerView.textColor = UIColor(displayP3Red: 0/255, green: 35/255, blue: 57/255, alpha: 1)
        
        //phoneNumberTextField.font = UIFont.futuraPTMedium(size: 23)
        phoneNumberTextField.textColor = UIColor(displayP3Red: 75/255, green: 86/255, blue: 90/255, alpha: 1)
        
        
        let h = getDeviceHeight()
        if h == 667.0 {
            loginLogoHeightConstraint.constant = 155
        } else {
            loginLogoHeightConstraint.constant = 188
        }
    }
    
}


