//
//  TicketCell.swift
//  livetrivia
//
//  Created by macbook on 17/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class TicketCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bottomLineView: UIView!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventCreatorLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupUI(eventTicket: EventTicket) {
        
        self.eventImageView.image = UIImage(named: eventTicket.eventImage)
        self.eventNameLabel.text = eventTicket.eventName
        self.eventCreatorLabel.text = eventTicket.eventCreator
        self.eventTimeLabel.text = eventTicket.eventDateTime
        self.eventLocationLabel.text = eventTicket.eventLocation
        self.eventDescriptionLabel.text = eventTicket.eventDescription
        
        containerView.applyCornerRadius(cornerRadius: 25)
        eventImageView.applyCornerRadius(cornerRadius: 12, true)
        
        changedToDashedLine(v: bottomLineView)
        
    }
    
    private func changedToDashedLine(v: UIView) {
        v.backgroundColor = UIColor.clear
        let caShapeLayer = CAShapeLayer()
        caShapeLayer.strokeColor = UIColor(red: 58/255, green: 153/255, blue: 216/255, alpha: 1).cgColor
        caShapeLayer.lineWidth = 4
        caShapeLayer.lineDashPattern = [10,3]
        let cgPath = CGMutablePath()
         
        let cgPoint = [CGPoint(x: v.bounds.minX , y: v.bounds.maxY), CGPoint(x: v.bounds.maxX, y: v.bounds.maxY)]
        cgPath.addLines(between: cgPoint)
        caShapeLayer.path = cgPath
        v.layer.addSublayer(caShapeLayer)
    }
    
}
