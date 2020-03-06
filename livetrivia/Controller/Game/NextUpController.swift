//
//  NextUpController.swift
//  livetrivia
//
//  Created by macbook on 16/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class NextUpController: BaseController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var firstItemImageView: UIImageView!
    @IBOutlet weak var secondItemImageView: UIImageView!
    @IBOutlet weak var secondItemLabel: UILabel!
    @IBOutlet weak var secondItemPriceLabel: UILabel!
    @IBOutlet weak var firstItemLabel: UILabel!
    @IBOutlet weak var firstItemPriceLabel: UILabel!
    @IBOutlet weak var thirdItemImageView: UIImageView!
    @IBOutlet weak var thirdItemLabel: UILabel!
    @IBOutlet weak var thirdItemPriceLabel: UILabel!
    @IBOutlet weak var prizesTableView: UITableView!
    @IBOutlet weak var dashedLineView: UIView!
    @IBOutlet weak var firstPersonNextUpImageView: UIImageView!
    @IBOutlet weak var secondPersonNextUpImageView: UIImageView!
    @IBOutlet weak var thirdPersonNextUpImageView: UIImageView!

    
    var prizes = ["Tickets","Sneakers", "Watch", "Tickets","Sneakers", "Watch","Sneakers"]
    var rank = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         setupUI()

    }
    
}

extension NextUpController {
    
    func setupUI() {
        
         containerView.applyCornerRadius(cornerRadius: 12)
         firstPersonNextUpImageView.applyCornerRadius(cornerRadius: 12, true)
         secondPersonNextUpImageView.applyCornerRadius(cornerRadius: 12, true)
         thirdPersonNextUpImageView.applyCornerRadius(cornerRadius: 12, true)

         dashedLineView.backgroundColor = UIColor.clear
         createDottedLine(x0: dashedLineView.bounds.minX, y0: dashedLineView.bounds.minY,x1: dashedLineView.bounds.maxX, y1: dashedLineView.bounds.maxY, width: 2, color: UIColor(red: 115/255, green: 183/255, blue: 229/255, alpha: 1), view: dashedLineView)
         
         
         firstItemImageView.roundView()
         secondItemImageView.roundView()
         thirdItemImageView.roundView()
         
         firstItemPriceLabel.roundedCorners()
         secondItemPriceLabel.roundedCorners()
         thirdItemPriceLabel.roundedCorners()
         
        
        prizesTableView.separatorStyle = .none
        prizesTableView.backgroundColor = UIColor.clear
    }
    
}

extension NextUpController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prizes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let winnerCell = tableView.dequeueReusableCell(withIdentifier: "winnerCell", for: indexPath) as? WinnerCell else {
                   fatalError("The dequeued cell is not of type WinnerCell")
               }
               
          let prize = prizes[indexPath.item]

          rank = rank + 1
          let rankString = String(rank)
          winnerCell.setUp(name: prize, currentRank: rankString)
               
          return winnerCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
}


