//
//  FriendsController.swift
//  livetrivia
//
//  Created by macbook on 02/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class FriendsController: BaseController {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var connectAddressBookButton: UIButton!
    @IBOutlet weak var dashedLineView: UIView!
    @IBOutlet weak var firstImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var middleImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var fourthImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var fifthImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var dashedLineViewTrailingConstraint: NSLayoutConstraint!
    
       
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
    }
    

}


extension FriendsController {
    
    fileprivate func setupUI() {
        
        print("widdthh:",getDeviceDimensions())
        
        let w = getDeviceDimensions().1
        if w == 736 {
            firstImageViewWidthConstraint.constant = 69
            fifthImageViewWidthConstraint.constant = 69
            
            middleImageViewWidthConstraint.constant = 108
            
            secondImageViewWidthConstraint.constant = 81
            fourthImageViewWidthConstraint.constant = 81
            
            
        }
        else if w == 896 {
            firstImageViewWidthConstraint.constant = 70
            fifthImageViewWidthConstraint.constant = 70
            
            middleImageViewWidthConstraint.constant = 109
            
            secondImageViewWidthConstraint.constant = 82
            fourthImageViewWidthConstraint.constant = 82
            
            
        }
        else {
            firstImageViewWidthConstraint.constant = 61
            fifthImageViewWidthConstraint.constant = 61
            
            secondImageViewWidthConstraint.constant = 73
            fourthImageViewWidthConstraint.constant = 73
            
        }
        
        if getDeviceDimensions().0 == 414 {
            dashedLineViewTrailingConstraint.constant = 9
        } else {
            dashedLineViewTrailingConstraint.constant = 16
        }
        
        
        searchView.roundedCorners()
        connectAddressBookButton.roundedCorners()
        
        dashedLineView.backgroundColor = UIColor.clear
         createDottedLine(x0: dashedLineView.bounds.minX, y0: dashedLineView.bounds.minY,x1: dashedLineView.bounds.maxX, y1: dashedLineView.bounds.maxY, width: 2, color: UIColor(red: 115/255, green: 183/255, blue: 229/255, alpha: 1), view: dashedLineView)
    
        connectAddressBookButton.addTarget(self, action: #selector(openContactVC), for: .touchUpInside)
        
    
    }
    
}
