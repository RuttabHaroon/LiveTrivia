//
//  EventTicket.swift
//  livetrivia
//
//  Created by macbook on 17/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import Foundation

class EventTicket {
    
    var eventImage: String
    var eventName: String
    var eventCreator: String
    var eventDateTime: String
    var eventLocation: String
    var eventDescription: String
    
    init(eventImage: String,
       eventName: String,
       eventCreator: String,
       eventDateTime: String,
       eventLocation: String,
       eventDescription: String) {
           self.eventImage = eventImage
           self.eventName = eventName
           self.eventCreator = eventCreator
           self.eventDateTime = eventDateTime
           self.eventLocation = eventLocation
           self.eventDescription = eventDescription
    }
    
}
