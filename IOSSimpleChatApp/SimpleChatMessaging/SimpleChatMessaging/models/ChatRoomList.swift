//
//  ChatRoomList.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 13/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import SwiftyJSON
import Firebase
import SVProgressHUD

class ChatRoomList{
    var list:[ChatRoomViewModel];
    init(){
        self.list=[];
    }
    func FetchFirebaseData(fb:FirebaseCustom, completionHandler: @escaping (Any?) -> ()){
        SVProgressHUD.show();
        var db=Database.database().reference().child("Inbox");
        fb.RetrieveDataValue(db:db, completionHandler: {
            (resp) in
            SVProgressHUD.dismiss();
            var temp=ChatRoomViewModel(id:resp!.key, rname:resp!.key, cc:[]);
            var dict=resp?.value as! Dictionary<String, Any?>;
            for (key, value) in dict{
                var json=value as! Dictionary<String, Any>;
//                var stemp=ChatViewModel();
//                stemp.set(id: key as! String, message: json["message"]! as! String, sender: json["sender"]! as! String, ia: false);
                temp.chatContent.append(ChatViewModel.Setup(dict: json, name: key));
            }
            self.list.append(temp);
            
            completionHandler(resp);
        })
    }
    
}
