//
//  ChatCell.swift
//  parseChat
//
//  Created by Biswash Adhikari on 3/1/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit
import Parse

class ChatCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    var message: PFObject! {
        didSet {
            //print(message.value(forKey: "text"))
            messageLabel.text = message.value(forKey: "text") as? String
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
