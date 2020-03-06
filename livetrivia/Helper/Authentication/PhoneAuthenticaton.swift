//
//  Authentication.swift
//  livetrivia
//
//  Created by macbook on 05/03/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit
import SVProgressHUD
import Firebase
import FirebaseAuth


extension BaseController {
    
    class func showHudWithError(_ error: String, _ view: UIView) {
        DispatchQueue.main.async {
            SVProgressHUD.showError(withStatus: error)
            view.isUserInteractionEnabled = true
        }
    }

    class func showHudWithSuccess(_ successMessage: String, _ view: UIView) {
        DispatchQueue.main.async {
            SVProgressHUD.showSuccess(withStatus: successMessage)
            view.isUserInteractionEnabled = true
        }
    }

    class func hideHud(_ view: UIView) {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
            view.isUserInteractionEnabled = true
        }
    }
    class func showHud(_ view: UIView) {
        DispatchQueue.main.async {
            view.isUserInteractionEnabled = false
            SVProgressHUD.show()
        }
    }
    
    
    func userAuthenticationViaPhoneNumber(phoneNumber: String, completion:@escaping (Bool) -> ()) {
           PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
               if let error = error {
                 print("Error \(error.localizedDescription)")
                 completion(false)
               }
               
               self.saveVerificationID(verificationID: verificationID ?? "")
               print(verificationID)
               
               completion(true)
           }
       }
       
       
       func saveVerificationID(verificationID: String) {
        
           UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
           
       }
       
       func signInUsingPhoneCode(completion:@escaping (Bool) -> ()) {
           let  verificationID = UserDefaults.standard.string(forKey: "authVerificationID") ?? ""
           let  verificationCode = UserDefaults.standard.string(forKey: "authVerificationCode") ?? ""
           
           let credential = PhoneAuthProvider.provider().credential(
           withVerificationID: verificationID,
           verificationCode: verificationCode)
           
           Auth.auth().signIn(with: credential) { (authResult, error) in
             if let error = error {
               print(error.localizedDescription)
               //completion(false)
               return
             }
               
               print(authResult)
               
             print("success")
             completion(true)
           }
       }
    
       
    func logOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
            if firebaseAuth.currentUser == nil {
                print(firebaseAuth.currentUser)
    
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainNavigationController = storyboard.instantiateViewController(withIdentifier: "mainNav") as! UINavigationController
    
                mainNavigationController.setViewControllers([storyboard.instantiateViewController(withIdentifier: "login")],
                                                animated: false)
    
    
    
                let window = UIApplication.shared.delegate!.window!!
                window.rootViewController = mainNavigationController
    
                
                
            } else {
                print("firebase user not logged out")
            }
            
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
}
