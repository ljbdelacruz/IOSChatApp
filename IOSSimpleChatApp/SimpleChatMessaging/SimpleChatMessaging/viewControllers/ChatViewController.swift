//
//  ChatViewController.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var UIRoomLabel: UILabel!
    @IBOutlet weak var UIMessageText: UITextField!
    @IBOutlet weak var UISendButton: UIButton!
    var messages:[ChatRoomViewModel]=[];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func OnSendClick(_ sender: Any) {
    }
    
}
