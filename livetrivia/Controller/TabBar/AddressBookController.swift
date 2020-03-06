//
//  AddressBookController.swift
//  livetrivia
//
//  Created by macbook on 02/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class AddressBookController: BaseController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var searchOverview: UIView!
    @IBOutlet weak var dashedView: UIView!
    @IBOutlet weak var contactsTableView: UITableView!
    
    
    let profileNames = ["Kate Oscarlet","Alan Hales", "Kate Williamson", "Alex Costa"
        , "Perry Alexandar"]
    
    let profileImages = ["profile_avatar_one","profile_avatar_5","profile_avatar_2", "profile_avatar_4", "profile_avatar_3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    @IBAction func onDismissButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension AddressBookController {
    
    fileprivate func setupUI() {
        containerView.roundCorners(corners: [.topLeft, .topRight], radius: 24)
        
        searchOverview.layer.borderColor = UIColor(red: 216/255, green: 229/255, blue: 238/255, alpha: 1).cgColor
        searchOverview.layer.borderWidth = 2.0
        searchOverview.roundedCorners()
        
        dashedView.backgroundColor = UIColor.clear
        createDottedLine(x0: dashedView.bounds.minX, y0: dashedView.bounds.minY,x1: dashedView.bounds.maxX, y1: dashedView.bounds.maxY, width: 2, color: UIColor(red: 216/255, green: 229/255, blue: 238/255, alpha: 1), view: dashedView)
        
        //contactsTableView.separatorStyle = .none
        
    }
    
}


extension AddressBookController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        
        let view = cell.viewWithTag(1) as! UIView
        let contactNameLabel = cell.viewWithTag(3) as! UILabel
        let inviteButton = cell.viewWithTag(4) as! UIButton
        let profileImageView = cell.viewWithTag(5) as! UIImageView
        
        view.applyCornerRadius(cornerRadius: 12)
        
        inviteButton.roundedCorners()
        
        profileImageView.roundView()
        
        
        contactNameLabel.text = profileNames[indexPath.item]
        profileImageView.image = UIImage(named:  profileImages[indexPath.item])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
}




