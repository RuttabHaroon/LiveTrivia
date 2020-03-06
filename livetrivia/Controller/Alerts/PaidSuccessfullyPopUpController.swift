//
//  PaidSuccessfullyPopUpController.swift
//  livetrivia
//
//  Created by macbook on 10/02/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit
import SwiftEntryKit 

class PaidSuccessfullyPopUpController: UIViewController {

    
    @IBOutlet weak var okayButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: "tick_vector")
        okayButton.roundedCorners()
    }
    
    @IBAction func onOkayTapped(_ sender: Any) {
        SwiftEntryKit.dismiss()
    }
    
}
