//
//  CreateProfileController.swift
//  livetrivia
//
//  Created by macbook on 26/12/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit


class CreateProfileController: BaseController {
    
    
    @IBOutlet weak var profileFrameImageView: UIImageView!
    @IBOutlet weak var profileFrameImageViewTop: NSLayoutConstraint!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileTextField: UITextField!
    @IBOutlet weak var profileUsernameView: UIView!
    @IBOutlet weak var refferalCodeView: UIView!
    @IBOutlet weak var referalTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @IBAction func onNextTapped(_ sender: Any) {
        if let vc = getVC(identifier: Commons.STORYBOARD_ID_NOTIFICATION_ON_OFF) as? NotificationOnOffController {
            vc.userData = [profileTextField.text ?? "" ,referalTextField.text ?? ""]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


extension CreateProfileController {
    
    func setupUI() {
        
        addBlackPlusButton(viewController: self)
        
        self.title = "Create Profile"
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: UIFont.futuraPTDemi(size: 28)]
        
        
        let h = getDeviceHeight()
        if h == 667.0 {
             profileFrameImageViewTop.constant = 40
        } else {
            profileFrameImageViewTop.constant = 100
        }
        
        profileImageView.roundView()
        
        profileTextField.attributedPlaceholder = NSAttributedString(string: "Pick Username",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 80/255, green: 89/255, blue: 94/255, alpha: 1.0)])
        
        self.profileTextField.delegate=self;
        self.profileTextField.textAlignment = .center;
        profileUsernameView.roundedCorners()
        
        
        referalTextField.attributedPlaceholder = NSAttributedString(string: "Refferal Code(Optional)",
                                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 80/255, green: 89/255, blue: 94/255, alpha: 1.0)])
        
        self.referalTextField.delegate=self;
        self.referalTextField.textAlignment = .center;
        refferalCodeView.roundedCorners()
        
        nextButton.roundedCorners()
    }
    
}


extension CreateProfileController: UITextFieldDelegate {
    func textField(_ theTextField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let textFieldRange = NSRange(location: 0, length: profileTextField.text?.count ?? 0)
        // Check If textField is empty. If empty align your text field to center, so that placeholder text will show center aligned
        if NSEqualRanges(range, textFieldRange) && string.count == 0 {
            profileTextField.textAlignment = .center
        } else {
            //profileTextField.textAlignment = .left
            profileTextField.textAlignment = .center
        }
        
        let referalTextFieldTextFieldRange = NSRange(location: 0, length: referalTextField.text?.count ?? 0)
        // Check If textField is empty. If empty align your text field to center, so that placeholder text will show center aligned
        if NSEqualRanges(range, referalTextFieldTextFieldRange) && string.count == 0 {
            referalTextField.textAlignment = .center
        } else {
            //referalTextField.textAlignment = .left
            referalTextField.textAlignment = .center
        }
        
        return true
    }

}
