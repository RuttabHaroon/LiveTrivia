//
//  TicketsController.swift
//  livetrivia
//
//  Created by macbook on 17/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class TicketsController: BaseController {
    
    @IBOutlet weak var ticketTableView: UITableView!
    
    var eventTickets: [EventTicket] = {
       return[EventTicket(eventImage: "apple_dev_event", eventName: "Jazz Night", eventCreator: "By Ricky Martin, San Francisco", eventDateTime: "Sat, Jan 18 @7:30 PM ", eventLocation: "Erskin Falls Road, Lorne VIC 33 323", eventDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"),
              EventTicket(eventImage: "kanya_west" , eventName:"Kanya West Pablo Tour" , eventCreator: "By Eric Williams, San Francisco", eventDateTime: "Sat, Jan 18 @7:30 PM ", eventLocation: "Erskin Falls Road, Lorne VIC 33 323", eventDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam")
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
}

extension TicketsController {
    func setupUI() {
        ticketTableView.separatorStyle = .none
    }
}

extension TicketsController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventTickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath) as? TicketCell else {
            fatalError("The dequeued cell is not of type ticketCell")
        }
        
        cell.setupUI(eventTicket: eventTickets[indexPath.item])
        if indexPath.item == eventTickets.count - 1 {
            cell.bottomLineView.isHidden = true
        } else {
            cell.bottomLineView.isHidden = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableView.automaticDimension
        return 353
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return 197
        return UITableView.automaticDimension
    }
}
