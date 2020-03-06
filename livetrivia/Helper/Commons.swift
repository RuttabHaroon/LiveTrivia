//
//  Commons.swift
//  livetrivia
//
//  Created by macbook on 26/12/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import Foundation

struct Commons {
    
    //STORYBOARD
    static let STORYBOARD_ID = "Main"
    static let STORYBOARD_ID_LOGIN = "login"
    static let STORYBOARD_ID_CODE_RECIEVED = "codeRecieved"
    static let STORYBOARD_ID_CREATE_PROFILE = "createProfile"
    static let STORYBOARD_ID_NOTIFICATION_ON_OFF = "notificationOnOff"
    
    
    static let STORYBOARD_ID_MAIN_TAB_BAR = "MainTab"
    static let STORYBOARD_ID_MAIN_TAB_BAR_SETTING = "setting"
    
    static let STORYBOARD_ID_ADDRESSBOOK = "addressBook"
    static let STORYBOARD_ID_LIVE = "live"
    
    static let STORYBOARD_ID_KNOCKOUT = "knockout"
    static let STORYBOARD_ID_NEXTUP = "nextup"
    static let STORYBOARD_ID_COUNTDOWN = "countdown"
    
    
    
    struct DateFormats {
        static let normal  = "MMM-dd-yyyy"
        static let dueDate = "MMM dd, yyyy"
        static let _12Hour =  DateFormats.normal + " " + "h:mm a"
        static let _taskDetailFormat =  DateFormats.normal + " " + "h:mm a"
        static let h_mm_a  = "h:mm a"
        static let _24Hour =  DateFormats.normal + " " + "HH:mm"
        static let timelineTime = "HH:mm"
        static let _NotificationTimeFormat = h_mm_a + " | " + dueDate
    }

    
}
