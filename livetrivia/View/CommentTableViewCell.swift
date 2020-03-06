//
//  CommentTableViewCell.swift
//  livetrivia
//
//  Created by macbook on 16/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(comment: Comment) {
        
        profileImageView.image = UIImage(named: comment.userProfilePicture)
        profileImageView.roundView()
        

        let commenter = comment.username + ":"
        let c = commenter + " " + comment.userMessage
        let attributedString = NSMutableAttributedString(string: c)
        
        let commenterRange = NSString(string: c).range(of: commenter, options: String.CompareOptions.caseInsensitive)
        attributedString.addAttributes([NSAttributedString.Key.font: UIFont(name: "FuturaPT-Demi", size: 20)], range: commenterRange)
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 187/255, green: 229/255, blue: 254/255, alpha: 1)], range: commenterRange)

        let commentRange = NSString(string: c).range(of: comment.userMessage, options: String.CompareOptions.caseInsensitive)
        attributedString.addAttributes([NSAttributedString.Key.font: UIFont(name: "FuturaPT-Book", size: 22)], range: commentRange)
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], range: commentRange)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0
        paragraphStyle.alignment = .left
        let total = NSString(string: c).range(of: c, options: String.CompareOptions.caseInsensitive)
        attributedString.addAttribute(.paragraphStyle, value:paragraphStyle, range:total)
        
        commentLabel.attributedText = attributedString
        
    }
    
    
}
