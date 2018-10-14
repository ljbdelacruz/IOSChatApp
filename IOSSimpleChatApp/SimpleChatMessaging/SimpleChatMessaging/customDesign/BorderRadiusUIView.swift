//
//  BorderRadius.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 14/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class BorderRadiusUIView: UIView {
    public var radius:Float?;
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layoutIfNeeded();
        self.layer.cornerRadius=CGFloat(10);
    }
}
