//
//  Category.swift
//  livetrivia
//
//  Created by macbook on 25/12/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit


extension UIView {
    
    func applyCornerRadius(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
    }
    
    func applyCornerRadius(cornerRadius: CGFloat, _ withMask: Bool = true) {
           self.layer.cornerRadius = cornerRadius
           self.layer.masksToBounds = withMask
    }
    
    func applyCornerRadius(cornerRadius: CGFloat, borderColor: UIColor, borderWidth: Int) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1
    }
    
    func addDropShadow(shadowColor: UIColor, shadowOpacity: Float, shadowRadius: CGFloat) {
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize(width: 2, height: 3)
        //layer.shadowOffset = .zero
        layer.shadowRadius = shadowRadius
        
        //self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        //self.layer.shouldRasterize = true
    }
    
    func addDropShadow(shadowColor: UIColor, shadowOpacity: Float, shadowRadius: CGFloat, shadowOffset: CGSize) {
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        //layer.shadowOffset = .zero
        layer.shadowRadius = shadowRadius
        
        //self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        //self.layer.shouldRasterize = true
    }
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    func roundView(){
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
    func roundedCorners(){
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
    
    func roundLayerOnView(color: UIColor, borderWidh: CGFloat){
        
        self.layer.borderWidth = borderWidh
        self.layer.masksToBounds = false
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
    func changeVerticalLineSpacing(lineSpacing: CGFloat, text: String) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        //enter your mobile phone number, including\n area code
        paragraphStyle.alignment = .center
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        return attrString
    }
    
    func shadowRoundedView() {
        let rect = CGRect.init(origin: CGPoint.init(x: 0,
                                                    y: 0),
                               size: CGSize.init(width: self.layer.frame.width,
                                                 height: self.layer.frame.height))
        let layer = CAShapeLayer.init()
        let path = UIBezierPath(roundedRect: rect, cornerRadius: (self.layer.frame.height))
        layer.path = path.cgPath;
        
        layer.fillColor = UIColor.clear.cgColor;
        
        layer.shadowColor = UIColor.green.cgColor
        layer.shadowPath = layer.path
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 15
        
        self.clipsToBounds = false
        
        self.layer.addSublayer(layer);
    }
    
    func createDottedLine(width: CGFloat, color: CGColor) {
        let caShapeLayer = CAShapeLayer()
        caShapeLayer.strokeColor = color
        caShapeLayer.lineWidth = width
        caShapeLayer.lineDashPattern = [10,5]
        let cgPath = CGMutablePath()
        
        let minX = self.bounds.minX
        let minY = self.bounds.minY
        
        let maxX = self.bounds.maxX
        let maxY = self.bounds.maxY
        
        let cgPoint = [CGPoint(x: minX , y: minY), CGPoint(x: maxX, y: maxY)]
        cgPath.addLines(between: cgPoint)
        caShapeLayer.path = cgPath
        layer.addSublayer(caShapeLayer)
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
          let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
          let mask = CAShapeLayer()
          mask.path = path.cgPath
          layer.mask = mask
    }
    
}

extension Date {
    func stringWithFormat(format : String) -> String{
        let fm : DateFormatter = DateFormatter()
        fm.dateFormat = format
        return fm.string(from: self)
    }
}

extension UIFont {
   
    class func futuraPTBook(size: CGFloat) -> UIFont {
        return UIFont(name: "FuturaPT-Book", size: size)!
    }
    
    class func futuraPTDemi(size: CGFloat) -> UIFont {
        return UIFont(name: "FuturaPT-Demi", size: size)!
    }
    
    class func futuraPTMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "FuturaPT-Medium", size: size)!
    }
}


extension AppDelegate {
    func setupNavBarAppearance(){
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage             = UIImage()
        UINavigationBar.appearance().backIndicatorImage      = UIImage()
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor.clear
        //UINavigationBar.appearance().tintColor = UIColor.primaryText
        //UINavigationItem().backBarButtonItem? = BaseViewController.getBackBtn()
        //        UINavigationItem().bac
    }
    
}



extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension UITableViewCell {
    @objc func onShareTapped(sender: UIButton) {
           if let button = sender as? UIButton {
               guard let title = button.accessibilityLabel else {return}
               //let image = UIImage(named: "profile_avatar_3")
               //let myWebsite = NSURL(string:"https://stackoverflow.com/users/4600136/mr-javed-multani?tab=profile")
              //let shareAll = [text , image! , myWebsite]
              let shareAll = [title]
              let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
              if let rootVC =  self.window?.rootViewController {
                  activityViewController.popoverPresentationController?.sourceView = rootVC.view
                  rootVC.present(activityViewController, animated: true, completion: nil)
              }
           }
       }
}
