//
//  ShoppingController.swift
//  livetrivia
//
//  Created by macbook on 17/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class ShoppingController: BaseController {

    @IBOutlet weak var shoppingTableView: UITableView!
    @IBOutlet weak var shoppingCartButton: UIButton!
    
    var shoppingItems: [ShoppingItem] = {
        return [
            ShoppingItem(name: "Rolex - Space Grey", description: "Digital Sports Wrist Watch - MultiColor by Markhor Shopping", rating: 3.1, itemImage: "watch", itemCount: 1, type: ShoppingItemType.shoppingItem),
            ShoppingItem(name: "EBH - Maroon", description: "Delta Maroon Office Long Boots For Men", rating: 3.1, itemImage: "watch", itemCount: 1, type: ShoppingItemType.shoppingItem),
            ShoppingItem(name: "Levi's SH Belt", description: "Every pair of jeans needs a good belt, and this one is crafted", rating: 3.1, itemImage: "watch", itemCount: 1, type: ShoppingItemType.shoppingItem),
            ShoppingItem(name: "Formal Shirt - Chemistry", description: "Made by the finest fabric with every article given its own individual care", rating: 3.1, itemImage: "watch", itemCount: 10 , type: ShoppingItemType.shoppingItem)
        ]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
    }

 
}

extension ShoppingController {
    func setup() {
        self.shoppingTableView.separatorStyle = .none
        
        shoppingCartButton.addTarget(self, action: #selector(onShoppingCartTapped), for: .touchUpInside)
        
    }
    
    @objc func onShoppingCartTapped() {
       guard let navVC = getVC(identifier: "cartNav") as? UINavigationController else {
            fatalError()
        }

        guard let vc = getVC(identifier: "myCart") as? ShoppingCartController else {
            fatalError()
        }

        navVC.pushViewController(vc, animated: true)

        self.present(navVC, animated: true, completion: nil)
    }
    
}

extension ShoppingController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath) as? ShoppingCell
            else {
                fatalError("The dequeud cell is not of type shopping cell")
        }
        
        let shoppingItem = shoppingItems[indexPath.item]
        cell.setupUI(shoppingItem: shoppingItem)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableView.automaticDimension
        return 197
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return 197
        return UITableView.automaticDimension
    }
    
}
