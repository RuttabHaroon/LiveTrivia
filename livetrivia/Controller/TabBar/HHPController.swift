//
//  HHPController.swift
//  livetrivia
//
//  Created by macbook on 07/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class HHPController: BaseController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var inviteButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heartsbadgeCountLabel: UILabel!
    @IBOutlet weak var powerBadgeCountLabel: UILabel!
    @IBOutlet weak var powerButton: UIButton!
    
    
    var imagesData = ["card-1","card-2","card-3","card-4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        
        
    }

}

extension HHPController {
    func setUpUI() {
        
        containerView.roundedCorners()
        inviteButton.roundedCorners()
        
        heartsbadgeCountLabel.roundView()
        powerBadgeCountLabel.roundView()
        
        heartsbadgeCountLabel.layer.borderWidth = 1
        heartsbadgeCountLabel.layer.borderColor = UIColor.white.cgColor
        
        powerBadgeCountLabel.layer.borderWidth = 1
        powerBadgeCountLabel.layer.borderColor = UIColor.white.cgColor
        
        inviteButton.layer.borderWidth = 1.0
        inviteButton.layer.borderColor = UIColor.darkGray.cgColor
        
        tableView.separatorStyle = .none
        
        powerButton.setImage(UIImage(named: "power"), for: .normal)
    }
}

extension HHPController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HHPCell", for: indexPath) as? HHPCell else {
            fatalError("The dequeued cell is not of type HHPCell")
        }
        
        cell.setup(imgString: imagesData[indexPath.item], index: indexPath.item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 236
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.item == 0 {
            pushVC(name: Commons.STORYBOARD_ID_LIVE)
        } else if indexPath.item == 1 {
            pushVC(name: Commons.STORYBOARD_ID_KNOCKOUT)
        }  else if indexPath.item == 2 {
            pushVC(name: Commons.STORYBOARD_ID_COUNTDOWN)
        } else {
            pushVC(name: Commons.STORYBOARD_ID_NEXTUP)
        }
    }
    
}
