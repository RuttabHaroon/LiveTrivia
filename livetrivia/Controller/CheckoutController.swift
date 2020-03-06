//
//  CheckoutController.swift
//  livetrivia
//
//  Created by macbook on 10/02/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class CheckoutController: BaseController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cardCollectionView: UICollectionView!
    @IBOutlet weak var cardInformationTableView: UITableView!
    @IBOutlet weak var proceedButton: UIButton!
    
    
    var cardInformationPlaceholders = ["Card Number","Card Holder Name","Expiration Date", "Month/Year","CVV/CVC"]
    
    var cardImages: [UIImage] = {
       return [UIImage(named: "visa")!,
               UIImage(named: "mastercard")!,
               UIImage(named: "paypal")!
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
    @IBAction func onCancelTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func onProceedTapped(_ sender: Any) {
        showPaidSuccessfullyPopup()
    }
    
}


extension CheckoutController {
    func setUp() {
        self.containerView.roundCorners(corners: [.allCorners], radius: 24)
        
        setUpCollectionView()
        
        setUpTableView()
        
        proceedButton.roundedCorners()
    }
    
    func setUpCollectionView() {
        self.cardCollectionView.dataSource = self
        self.cardCollectionView.delegate = self
    }
    
    func setUpTableView() {
        self.cardInformationTableView.dataSource = self
        self.cardInformationTableView.delegate = self
        self.cardInformationTableView.separatorStyle = .none
    }
    
}

extension CheckoutController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardCell else {
            fatalError()
        }
        
        cardCell.setUpUI(img: cardImages[indexPath.item])
        
        return cardCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cardCell = collectionView.cellForItem(at: indexPath) as? CardCell else { return}
       // cardCell.addDropShadow(shadowColor: UIColor(red:0.75, green:0.85, blue:0.95, alpha:1.0), shadowOpacity: 0.40, shadowRadius: 10)
    }
    
}

extension CheckoutController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 125, height: 90)
    }
}


extension CheckoutController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardInformationPlaceholders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cardInformationCell", for: indexPath) as? CardInformationCell else {fatalError()}
        
        cell.setUpUI(placeholder: cardInformationPlaceholders[indexPath.item], index: indexPath.item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}

