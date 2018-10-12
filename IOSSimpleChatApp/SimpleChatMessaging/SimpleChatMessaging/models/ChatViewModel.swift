//
//  ChatViewModel.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation

class ChatViewModel{
    public var ID, Message:String;
    public var Sender:UserInfo;
    init(){
        self.ID="";
        self.Message="";
        self.Sender=UserInfo();
    }
    convenience init(id:String, message:String, userInfo:UserInfo){
        self.init();
        self.set(id: id, message: message, userInfo: userInfo);
    }
    func set(id:String, message:String, userInfo:UserInfo){
        self.ID=id;
        self.Message=message;
        self.Sender=userInfo;
    }
    
}
