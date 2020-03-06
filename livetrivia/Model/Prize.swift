//
//  Prizes.swift
//  livetrivia
//
//  Created by macbook on 13/02/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import Foundation

class Prize: NSObject {
    
    var prizeName: String
    var prizeAmount: String
    var prizeImage: String
    var prizeRank: String
    
    init(prizeName: String, prizeAmount: String, prizeImage: String, prizeRank: String) {
        self.prizeName = prizeAmount
        self.prizeAmount = prizeAmount
        self.prizeImage = prizeImage
        self.prizeRank = prizeRank
    }
    
}
