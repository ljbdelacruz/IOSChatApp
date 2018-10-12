//
//  ChatRoomViewModel.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation


class ChatRoomViewModel{
    public var ID, RoomName:String;
    public var chatContent:[ChatViewModel]=[];
    init(){
        self.ID="";
        self.RoomName="";
        self.chatContent=[];
    }
    
}
