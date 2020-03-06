//
//  ShoppingCartCell.swift
//  livetrivia
//
//  Created by macbook on 10/02/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit
import Cosmos

class ShoppingCartCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemRatingLabel: UILabel!
    @IBOutlet weak var itemStarRating: UIView!
    @IBOutlet weak var shoppingContainerView: UIView!
    @IBOutlet weak var itemCountLabel: UILabel!
  
    @IBOutlet weak var itemTimeImageView: UIImageView!
    @IBOutlet weak var itemTimeLabel: UILabel!
    
    @IBOutlet weak var addImageView: UIImageView!
    @IBOutlet weak var minusImageView: UIImageView!
    
    @IBOutlet weak var itemLocationImageView: UIImageView!
    @IBOutlet weak var itemLocationLabel: UILabel!
    
    
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
    
        let addTap = UITapGestureRecognizer(target: self, action: #selector(onAddTapped))
        addImageView.addGestureRecognizer(addTap)
        addImageView.isUserInteractionEnabled = true
        
        let minusTap = UITapGestureRecognizer(target: self, action: #selector(onSubtractTapped))
        minusImageView.addGestureRecognizer(minusTap)
        minusImageView.isUserInteractionEnabled = true
        
        
        if let i = cartItem as? ShoppingItem {
                   itemCountLabel.roundedCorners()
                   itemImageView.applyCornerRadius(cornerRadius: 12)
            
                   itemCountLabel.layer.borderColor = UIColor(red:0.75, green:0.85, blue:0.95, alpha:1.0).cgColor
                   itemCountLabel.layer.borderWidth = 2
            
                   itemImageView.image = UIImage(named: i.itemImage)
                   itemNameLabel.text = i.name
                   itemDescriptionLabel.text = i.description
                   itemRatingLabel.text = String(describing: i.rating)
                   itemCountLabel.text = String(describing: i.itemCount)

                   itemCountLabel.text = String(describing: i.itemCount)
                   currentItemCount = i.itemCount
            
                   self.accessibilityLabel = String(describing: index)
            
                  itemTimeImageView.isHidden = true
                  itemTimeLabel.isHidden = true
                  
                  itemLocationImageView.isHidden = true
                  itemLocationLabel.isHidden = true
            
                  itemStarRating.isHidden = false
                  itemRatingLabel.isHidden = false
            
            
        } else if let t = cartItem as? EventTicket {
                   itemCountLabel.roundedCorners()
                   itemImageView.applyCornerRadius(cornerRadius: 12)
            
                   itemCountLabel.layer.borderColor = UIColor(red:0.75, green:0.85, blue:0.95, alpha:1.0).cgColor
                   itemCountLabel.layer.borderWidth = 1
            
                   itemImageView.image = UIImage(named: t.eventImage)
                   itemNameLabel.text = t.eventName
                   itemDescriptionLabel.text = t.eventCreator
            
                   self.accessibilityLabel = String(describing: index)
            
                    itemTimeImageView.isHidden = false
                    itemTimeLabel.isHidden = false
                    
                    itemLocationImageView.isHidden = false
                    itemLocationLabel.isHidden = false
            
                    itemStarRating.isHidden = true
                    itemRatingLabel.isHidden = true
            
                
        }
    }
    
    
    @objc func updateItemCountValue() {
        self.itemCountLabel.text =  String(describing: currentItemCount)
    }
    
    
    func displayConfirmItemRemoveAlert() {
       let alert =  UIAlertController(title: "Confirm", message: "Do you wish to remove this item from cart?", preferredStyle: .alert)
       let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
       let yesAction = UIAlertAction(title: "Yes", style: .default) { [weak self](_) in
           if let delegate = self?.delegate {
            
                if let itemIndex = self?.accessibilityLabel {
                    let index = Int(itemIndex)
                    delegate.shoppingCartItems.remove(at: index ?? 0)
                    delegate.cartTableView.reloadData()
                }
           }
       }
       
       alert.addAction(cancelAction)
       alert.addAction(yesAction)
       
       delegate?.present(alert, animated: true, completion: nil)
    }
    
    @objc func onSubtractTapped(_ sender: Any) {
        
        if currentItemCount == 1 {
           
            displayConfirmItemRemoveAlert()
            
        } else {
            currentItemCount -= 1
        }
        
        updateItemCountValue()
        
    }
    
    @objc func onAddTapped(_ sender: Any) {
        currentItemCount += 1
        
        updateItemCountValue()
    }
    
}
