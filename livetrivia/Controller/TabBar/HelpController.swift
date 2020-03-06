//
//  HelpController.swift
//  livetrivia
//
//  Created by macbook on 03/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class HelpController: BaseController {

    
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func omCloseTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension HelpController {
    fileprivate func setupUI() {
        containerView.applyCornerRadius(cornerRadius: 25)
        contentView.applyCornerRadius(cornerRadius: 25)
        boxView.applyCornerRadius(cornerRadius: 25)
    }
}
