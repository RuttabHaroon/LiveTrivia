//
//  PowerUpController.swift
//  livetrivia
//
//  Created by macbook on 02/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class PowerUpController: BaseController {

    @IBOutlet weak var erasersContainerView: UIView!
    @IBOutlet weak var eraserAvailableCountLabel: UILabel!
    @IBOutlet weak var superSpinsContainerView: UIView!
    @IBOutlet weak var superspinsAvailableCountLabel: UILabel!
    @IBOutlet weak var shareCodeButton: UIButton!
    @IBOutlet weak var eraserLabel: UILabel!
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var superspinLabel: UILabel!
    @IBOutlet weak var eraserLearnMoreButton: UIButton!
    @IBOutlet weak var superSpinsLabel: UILabel!
    @IBOutlet weak var superspinLearnMoreButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
       
        
        
    }
    
}

extension PowerUpController {
    
    fileprivate func setupUI() {
        erasersContainerView.applyCornerRadius(cornerRadius: 12)
        superSpinsContainerView.applyCornerRadius(cornerRadius: 12)
        
        eraserAvailableCountLabel.roundView()
        eraserAvailableCountLabel?.layer.masksToBounds = true
        
        superspinsAvailableCountLabel.roundView()
        superspinsAvailableCountLabel?.layer.masksToBounds = true
        
        boxView.applyCornerRadius(cornerRadius: 12)
        
        shareCodeButton.applyCornerRadius(cornerRadius: 12)
        
        let eraserLearnMoreRange = NSString(string: eraserLabel.text ?? "").range(of: "Learn more", options: String.CompareOptions.caseInsensitive)
        let eraserLearnMoreAttributed = NSMutableAttributedString(string: eraserLabel.text ?? "")
        eraserLearnMoreAttributed.addAttributes([NSAttributedString.Key.font: UIFont(name: "FuturaPT-Medium", size: 19)], range: NSRange(location: 0, length: eraserLabel.text?.count ?? 0))
        eraserLearnMoreAttributed.addAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 59/255, green: 153/255, blue: 216/255, alpha: 1)], range: eraserLearnMoreRange)
        eraserLabel.attributedText = eraserLearnMoreAttributed

        
        let supersSpinsLearnMoreRange = NSString(string: superSpinsLabel.text ?? "").range(of: "Learn more", options: String.CompareOptions.caseInsensitive)
        let supersSpinsMoreAttributed = NSMutableAttributedString(string: superSpinsLabel.text ?? "")
        supersSpinsMoreAttributed.addAttributes([NSAttributedString.Key.font: UIFont(name: "FuturaPT-Medium", size: 19)], range: NSRange(location: 0, length: superSpinsLabel.text?.count ?? 0))
        supersSpinsMoreAttributed.addAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 59/255, green: 153/255, blue: 216/255, alpha: 1)], range: supersSpinsLearnMoreRange)
        superSpinsLabel.attributedText = supersSpinsMoreAttributed
        
        
        eraserLearnMoreButton.addTarget(self, action: #selector(openHelp), for: .touchUpInside)
        superspinLearnMoreButton.addTarget(self, action: #selector(openHelp), for: .touchUpInside)
        
        shareCodeButton.addTarget(self, action: #selector(shareCodeWithFriends(sender:)), for: .touchUpInside)
        
    }
    

    
}
