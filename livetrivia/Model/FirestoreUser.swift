//
//  FirestoreUser.swift
//  livetrivia
//
//  Created by macbook on 05/03/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import PromiseKit

class FirestoreUser {
    
    var id : String?
    var phoneNumber: String?
    var username: String?
    var referralCode: String?
    var imageUrl : String?
    
    var createdAt          : String?
    var createdAtDate      : Date?
    var createdAtStamp     : Timestamp?
    
    
    static var shared : FirestoreUser?
    
    init(withSnapshot snap : DocumentSnapshot) {
            
        self.id      = snap.get("id") as? String
        self.phoneNumber       = snap.get("phoneNumber")  as? String
        
        
        self.username    = snap.get("username")as? String
        self.referralCode      = snap.get("referralCode")as? String
        
        self.imageUrl      = snap.get("imageUrl") as? String

        self.createdAtStamp  = snap.get("createdAt") as? Timestamp
        self.createdAtDate   = self.createdAtStamp?.dateValue()
        self.createdAt       = self.createdAtDate?.stringWithFormat(format: Commons.DateFormats.normal)
            
    }
    
    
    class func createWith(data : [String:Any]) -> Promise<FirestoreUser>{
        var data   = data
        let id = data["id"] as! String
        let docRef = FirestoreHelper.users.document(id)
        
        return Promise<FirestoreUser> { promise in
            FirestoreHelper.saveToDocumentRef(ref: docRef, data: data)
                .then{ uid -> Promise<DocumentSnapshot> in
                    let ref = FirestoreHelper.users.document(uid)
                    return FirestoreHelper.getDocument(ref: ref)
                }.done { uSnap in
                    let user = FirestoreUser(withSnapshot: uSnap)
                    promise.fulfill(user)
                }.catch{ err in
                    promise.reject(err)
            }
        }
    }
    
}
