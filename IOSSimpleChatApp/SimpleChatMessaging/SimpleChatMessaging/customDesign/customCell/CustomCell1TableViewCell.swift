//
//  CustomCell1TableViewCell.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class CustomCell1TableViewCell: UITableViewCell {

    @IBOutlet weak var UIProfileImage: UIImageView!
    @IBOutlet weak var UITitle: UILabel!
    @IBOutlet weak var UIDefaultMessage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
