//
//  FirestoreHelper.swift
//  livetrivia
//
//  Created by macbook on 05/03/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit
import FirebaseFirestore
import PromiseKit

class FirestoreHelper {
    
    static let db = Firestore.firestore()
    static let userStr = "Users"
    
    static let users = db.collection(userStr)
    
    static func setupDb(){
        let settings = db.settings
        settings.isPersistenceEnabled = false
        settings.areTimestampsInSnapshotsEnabled = true
        FirestoreHelper.db.settings = settings
    }
    
    class func saveToDocumentRef(ref : DocumentReference,data : [String : Any]) -> Promise<String>{
        return Promise<String> { promise in
            ref.setData(data, completion: { (error) in
                if let err = error {
                    if let err = error {
                        promise.reject(err)
                    }else{
                        promise.reject(err)
                    }
                    return
                }
                promise.fulfill(ref.documentID)
            })
        }
    }
    class func getDocument(ref : DocumentReference) -> Promise<DocumentSnapshot>{
        return Promise<DocumentSnapshot> { promise in
            ref.getDocument(completion: { (snapshot, error) in
                guard let snap = snapshot else {
                    if let err = error {
                        promise.reject(err)
                    }else{
                        //promise.reject(err)
                    }
                    return
                }
                if snap.exists == false{
                    //promise.reject(err)
                }else{
                    promise.fulfill(snap)
                }
            })
        }
    }
}
