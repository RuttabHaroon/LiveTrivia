//
//  ShoppingItem.swift
//  livetrivia
//
//  Created by macbook on 17/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import Foundation


enum ShoppingItemType: Int, CaseIterable {
    case shoppingItem
    case ticket
}

class ShoppingItem {
    
    var name: String
    var description: String
    var rating: Double
    var itemImage: String
    var itemCount: Int
    var type: ShoppingItemType
    
    init(name: String, description: String, rating: Double, itemImage: String, itemCount: Int,type: ShoppingItemType) {
        self.name =  name
         self.description = description
         self.rating = rating
         self.itemImage = itemImage
         self.itemCount = itemCount
         self.type = type
    }
    
}
