//
//  ShoppingCartCellB.swift
//  livetrivia
//
//  Created by macbook on 10/02/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit


class ShoppingCartCellB: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
       @IBOutlet weak var itemNameLabel: UILabel!
       @IBOutlet weak var itemDescriptionLabel: UILabel!
       @IBOutlet weak var itemLocationLabel: UILabel!
       @IBOutlet weak var itemTimeLabel: UIView!
       @IBOutlet weak var shoppingContainerView: UIView!
       @IBOutlet weak var itemCountLabel: UILabel!
       @IBOutlet weak var subtractCountButton: UIButton!
       @IBOutlet weak var addCountButton: UIButton!
    
    var currentItemCount = 1
    
    var delegate: ShoppingCartController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
     func setupUI(cartItem: Any, index: Int) {
            
        if let t = cartItem as? EventTicket {
                       itemCountLabel.roundedCorners()
                       itemImageView.applyCornerRadius(cornerRadius: 12)
                
                       itemCountLabel.layer.borderColor = UIColor(red:0.75, green:0.85, blue:0.95, alpha:1.0).cgColor
                       itemCountLabel.layer.borderWidth = 1
                
                       itemImageView.image = UIImage(named: t.eventImage)
                       itemNameLabel.text = t.eventName
                       itemDescriptionLabel.text = t.eventDescription
                       //itemRatingLabel.text = String(describing: t.rating)
                       //itemCountLabel.text = String(describing: t.itemCount)
                
                       subtractCountButton.roundView()
                        subtractCountButton.layer.borderColor = UIColor(red:0.88, green:0.41, blue:0.65, alpha:1.0).cgColor
                       subtractCountButton.layer.borderWidth = 1
                
                       addCountButton.roundView()
                
    //                   itemCountLabel.text = String(describing: t.itemCount)
    //                   currentItemCount = t.itemCount
                
                       self.accessibilityLabel = String(describing: index)
            }
    }
    
    func updateItemCountValue() {
        self.itemCountLabel.text =  String(describing: currentItemCount)
    }
    
//    @IBAction func onAddTapped(_ sender: Any) {
//        currentItemCount += 1
//        updateItemCountValue()
//
//    }
//
//    @IBAction func onSubtractTapped(_ sender: Any) {
//        if currentItemCount == 1 {
//
//            displayConfirmItemRemoveAlert()
//
//        } else {
//            currentItemCount -= 1
//        }
//
//        updateItemCountValue()
//    }
    
    
}
