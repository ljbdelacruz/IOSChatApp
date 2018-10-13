//
//  ChatRoomViewModel.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import Firebase
import SVProgressHUD

class ChatRoomViewModel{
    public var ID, RoomName:String;
    public var chatContent:[ChatViewModel]=[];
    init(){
        self.ID="";
        self.RoomName="";
        self.chatContent=[];
    }
    convenience init(id:String, rname:String, cc:[ChatViewModel]){
        self.init();
        self.set(id: id, rname: rname, cc: cc);
    }
    func set(id:String, rname:String, cc:[ChatViewModel]){
        self.ID=id;
        self.RoomName=rname;
        self.chatContent=cc;
    }
    func FetchConversation(fbCustom:FirebaseCustom, name:String, completionHandler: @escaping (Any?) -> ()){
        SVProgressHUD.show()
        let db=Database.database().reference().child("Inbox").child(name);
        fbCustom.RetrieveDataValue(db:db,completionHandler: {
            (response) in
            SVProgressHUD.dismiss()
            if response != nil{
                var dict=response!.value as! Dictionary<String, Any>;
                self.chatContent.append(ChatViewModel.Setup(dict: dict, name: name));
                completionHandler(response);
            }
        })
    }

    
    
    
}
