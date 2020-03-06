//
//  Comment.swift
//  livetrivia
//
//  Created by macbook on 20/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import Foundation

class Comment {
    
    var userProfilePicture: String
    var username: String
    var userMessage: String
    
    init(userProfilePicture: String, username: String, userMessage: String) {
        self.userProfilePicture = userProfilePicture
        self.username =  username
        self.userMessage =  userMessage
    }
    
}
