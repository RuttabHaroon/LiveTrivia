//
//  BaseController.swift
//  livetrivia
//
//  Created by macbook on 26/12/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit
import SwiftEntryKit
import Firebase
import FirebaseAuth

class BaseController: UIViewController {
    
    func getDeviceDimensions()->(CGFloat, CGFloat) {
        let dimensions = (UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        return dimensions
    }
    
    func getDeviceHeight()->CGFloat {
        
        //iPhone XR = 896
        //iPhone Xs Max = 896.0
        
        //iPhone Xs = 812.0
        //iPHONE X = 812.0
        
        
        //iPHONE 6,6s,7,8 = 667.0
        
        //iPhone 6Plus, 6sPlus, 7Plus, 8Plus = 736.0
        
        let height = UIScreen.main.bounds.size.height
        return height
    }

    func addBlackPlusButton(viewController : UIViewController){
        let btn = UIButton()
        let image = UIImage(named: "back_icon")?.withRenderingMode(.alwaysTemplate)
        btn.setImage(image, for: .normal)
        btn.imageView?.tintColor = UIColor.black
        btn.addTarget(self, action: #selector(popFromNav), for: .touchUpInside)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12)
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        let bbi = UIBarButtonItem(customView: btn)
        viewController.navigationItem.leftBarButtonItem = bbi
    }
    
    func addWhiteCrossButton(viewController : UIViewController){
        let btn = UIButton()
        let image = UIImage(named: "cancel")
        btn.setImage(image, for: .normal)
        btn.addTarget(self, action: #selector(popYouWonPopUp), for: .touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: 105, height: 44)
        let bbi = UIBarButtonItem(customView: btn)
        viewController.navigationItem.rightBarButtonItem = bbi
    }
    
//    func addGrayCrossButton(viewController : UIViewController){
//         let btn = UIButton()
//         let image = UIImage(named: "cancel_gray")
//         btn.setImage(image, for: .normal)
//        btn.addTarget(self, action: #selector(PopupHelper.dismissPOPUp(rootVC:)), for: .touchUpInside)
//         btn.frame = CGRect(x: 0, y: 0, width: 105, height: 44)
//         let bbi = UIBarButtonItem(customView: btn)
//         viewController.navigationItem.rightBarButtonItem = bbi
//     }
    
    @objc func popYouWonPopUp() {
        let transition:CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.popViewController(animated: false)
    }
    
    func addRoundNextButton(viewController : UIViewController){
          let btn = UIButton()
          let image = UIImage(named: "next_btn")
          btn.setImage(image, for: .normal)
          btn.addTarget(self, action: #selector(pushTabBarVC), for: .touchUpInside)
          btn.frame = CGRect(x: 0, y: 0, width: 105, height: 44)
          let bbi = UIBarButtonItem(customView: btn)
          viewController.navigationItem.rightBarButtonItem = bbi
    }
    
    func addBiggerRoundNextButton(viewController : UIViewController){
          let btn = UIButton()
          let image = UIImage(named: "next_btn")
          btn.setImage(image, for: .normal)
          btn.addTarget(self, action: #selector(pushTabBarVC), for: .touchUpInside)
          btn.frame = CGRect(x: 0, y: 0, width: 115, height: 104)
          let bbi = UIBarButtonItem(customView: btn)
          viewController.navigationItem.rightBarButtonItem = bbi
    }
    
    func addNextQuestionRoundNextButton(viewController : UIViewController){
           let btn = UIButton()
           let image = UIImage(named: "next_btn")
           btn.setImage(image, for: .normal)
            
           btn.addTarget(self, action: #selector(pushTabBarVC), for: .touchUpInside)
           //btn.addTarget(self, action: #selector(createNewUser), for: .touchUpInside)
           btn.frame = CGRect(x: 0, y: 0, width: 105, height: 44)
           let bbi = UIBarButtonItem(customView: btn)
           viewController.navigationItem.rightBarButtonItem = bbi
    }
    
    @objc func pushTabBarVC() {
          let vc = getVC(identifier: Commons.STORYBOARD_ID_MAIN_TAB_BAR)
          
          let transition:CATransition = CATransition()
          transition.duration = 0.5
          transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
          transition.type = CATransitionType.push
          transition.subtype = CATransitionSubtype.fromTop
          self.navigationController!.view.layer.add(transition, forKey: kCATransition)
          self.navigationController?.pushViewController(vc, animated: false)
    }
      
    func pushVC(name: String) {
        let vc = getVC(identifier: name)
  
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getVC(identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    @objc func openContactVC() {
        let identifier = Commons.STORYBOARD_ID_ADDRESSBOOK
          let vc = getVC(identifier: identifier)
    
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @objc func openHelp() {
        let vc = getVC(identifier: "help") as! HelpController
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func popFromNav() {
        if self.navigationController != nil {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func shareCodeWithFriends(sender: UIButton) {
           if let button = sender as? UIButton {
            guard let title = button.titleLabel?.text else {return}
              let shareAll = [title]
              let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
              activityViewController.popoverPresentationController?.sourceView = self.view
              self.present(activityViewController, animated: true, completion: nil)
           }
    }
    
    func createDottedLine(x0: CGFloat, y0: CGFloat,x1: CGFloat, y1: CGFloat, width: CGFloat, color: UIColor, view: UIView) {
        let caShapeLayer = CAShapeLayer()
        caShapeLayer.strokeColor = color.cgColor
        caShapeLayer.lineWidth = 2
        caShapeLayer.lineDashPattern = [3,3]
        let cgPath = CGMutablePath()
        
        let cgPoint = [CGPoint(x: x0 , y: y0), CGPoint(x: x1, y: y1)]
        cgPath.addLines(between: cgPoint)
        caShapeLayer.path = cgPath
        view.layer.addSublayer(caShapeLayer)
    }
    
    func showRejectedPopup(){
        
        DispatchQueue.main.async {
                    
            var attributes = EKAttributes()
            attributes = .centerFloat
            attributes.scroll = .edgeCrossingDisabled(swipeable: true)
            #if os(iOS)
            attributes.statusBar = .dark
            #endif

            attributes.displayDuration = .infinity

            attributes.entranceAnimation = .init(translate: .init(duration: 0.5, spring: .init(damping: 0.9, initialVelocity: 0)),
                                                 scale: .init(from: 0.8, to: 1, duration: 0.5, spring: .init(damping: 0.8, initialVelocity: 0)),
                                                 fade: .init(from: 0.7, to: 1, duration: 0.3))
            attributes.exitAnimation = .init(translate: .init(duration: 0.5),
                                             scale: .init(from: 1, to: 0.8, duration: 0.5),
                                             fade: .init(from: 1, to: 0, duration: 0.5))
            attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3),
                                                                scale: .init(from: 1, to: 0.8, duration: 0.3)))

           attributes.positionConstraints.size = .init(width: EKAttributes.PositionConstraints.Edge.constant(value: 325), height: EKAttributes.PositionConstraints.Edge.constant(value: 425))
            attributes.windowLevel = .alerts
            
            attributes.screenBackground = .color(color: EKColor(UIColor(white: 0.5, alpha: 0.5)))
            attributes.entryInteraction = .absorbTouches
           
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "rejectedPopup")
            vc.view.applyCornerRadius(cornerRadius: 26)
            
            SwiftEntryKit.display(entry: vc, using: attributes)
        }
    }
    
    func showPaidSuccessfullyPopup(){
        
        DispatchQueue.main.async {
                    
            var attributes = EKAttributes()
            attributes = .centerFloat
            attributes.scroll = .edgeCrossingDisabled(swipeable: true)
            #if os(iOS)
            attributes.statusBar = .dark
            #endif

            attributes.displayDuration = .infinity

            attributes.entranceAnimation = .init(translate: .init(duration: 0.5, spring: .init(damping: 0.9, initialVelocity: 0)),
                                                 scale: .init(from: 0.8, to: 1, duration: 0.5, spring: .init(damping: 0.8, initialVelocity: 0)),
                                                 fade: .init(from: 0.7, to: 1, duration: 0.3))
            attributes.exitAnimation = .init(translate: .init(duration: 0.5),
                                             scale: .init(from: 1, to: 0.8, duration: 0.5),
                                             fade: .init(from: 1, to: 0, duration: 0.5))
            attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3),
                                                                scale: .init(from: 1, to: 0.8, duration: 0.3)))

           attributes.positionConstraints.size = .init(width: EKAttributes.PositionConstraints.Edge.constant(value: 325), height: EKAttributes.PositionConstraints.Edge.constant(value: 425))
            attributes.windowLevel = .alerts
            
            attributes.screenBackground = .color(color: EKColor(UIColor(white: 0.5, alpha: 0.5)))
            attributes.entryInteraction = .absorbTouches
           
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "paidSuccessfullyPopUp") as! PaidSuccessfullyPopUpController
            vc.view.applyCornerRadius(cornerRadius: 26)
            
            SwiftEntryKit.display(entry: vc, using: attributes)
        }
    }
    
    @objc func shareWithOthers() {
       let text = "This is the text...."
       let image = UIImage(named: "profile_avatar_2")
       //let myWebsite = NSURL(string:"https://stackoverflow.com/users/4600136/mr-javed-multani?tab=profile")
       //let shareAll = [text , image! , myWebsite]
       let shareAll = [text]
       let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
       activityViewController.popoverPresentationController?.sourceView = self.view
       self.present(activityViewController, animated: true, completion: nil)
    }
}
