//
//  ShoppingCell.swift
//  livetrivia
//
//  Created by macbook on 17/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit
import Cosmos

class ShoppingCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemStarRatingView: CosmosView!
    @IBOutlet weak var itemRatingLabel: UILabel!
    @IBOutlet weak var itemCountButton: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var shoppingContainerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(shoppingItem: ShoppingItem) {
        shoppingContainerView.applyCornerRadius(cornerRadius: 12)
        itemCountButton.roundedCorners()
        addToCartButton.roundedCorners()
        itemImageView.applyCornerRadius(cornerRadius: 12)
        
        itemCountButton.layer.borderColor = UIColor(red:0.75, green:0.85, blue:0.95, alpha:1.0).cgColor
        itemCountButton.layer.borderWidth = 1
        
        itemImageView.image = UIImage(named: shoppingItem.itemImage)
        itemNameLabel.text = shoppingItem.name
        itemDescriptionLabel.text = shoppingItem.description
        itemRatingLabel.text = String(describing: shoppingItem.rating)
        itemCountButton.text = String(describing: shoppingItem.itemCount)
    }

}
