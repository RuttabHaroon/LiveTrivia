//
//  ShoppingCartController.swift
//  livetrivia
//
//  Created by macbook on 10/02/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class ShoppingCartController: BaseController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var bottonmContainerView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    var shoppingCartItems: [Any] = {
        return [
            ShoppingItem(name: "Rolex - Space Grey", description: "Digital Sports Wrist Watch - MultiColor by Markhor Shopping", rating: 3.1, itemImage: "watch", itemCount: 1, type: ShoppingItemType.shoppingItem),
            ShoppingItem(name: "EBH - Maroon", description: "Delta Maroon Office Long Boots For Men", rating: 3.1, itemImage: "watch", itemCount: 1, type: ShoppingItemType.shoppingItem),
            EventTicket(eventImage: "apple_dev_event", eventName: "Jazz Night", eventCreator: "By Ricky Martin, San Francisco", eventDateTime: "Sat, Jan 18 @7:30 PM ", eventLocation: "Erskin Falls Road, Lorne VIC 33 323", eventDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"),
             ShoppingItem(name: "Formal Shirt - Chemistry", description: "Made by the finest fabric with every article given its own individual care", rating: 3.1, itemImage: "watch", itemCount: 10 , type: ShoppingItemType.shoppingItem)
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        
    }

    @IBAction func onPlaceOrderTapped(_ sender: Any) {
        
        guard let vc = getVC(identifier: "checkout") as? CheckoutController else {
            fatalError()
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func onCancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension ShoppingCartController {
    
    func setUp() {
        setUpTableView()
        
        placeOrderButton.roundedCorners()
                
    }
    
    private func setUpTableView() {
        cartTableView.dataSource = self
        cartTableView.delegate = self
        
        self.cartTableView.roundCorners(corners: [.allCorners], radius: 24)
        
        self.cartTableView.separatorInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 8)
    }
}

extension ShoppingCartController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

   
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCartCell", for: indexPath) as? ShoppingCartCell else {
            fatalError()
        }
        
        if let i = shoppingCartItems[indexPath.item] as? ShoppingItem {
            cell.setupUI(cartItem: i, index: indexPath.item)
        
        } else if let t = shoppingCartItems[indexPath.item] as? EventTicket {
            cell.setupUI(cartItem: t, index: indexPath.item)
        }
        
        
        cell.delegate = self
        
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: false)
     }
     
     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
         return 197
     }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
     }
}
