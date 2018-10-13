//
//  ChatViewModel.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import Firebase

class ChatViewModel{
    public var id, message, sender:String;
    public var isArchived:Bool;
    init(){
        self.id="";
        self.message="";
        self.sender="";
        self.isArchived=false;
    }
    convenience init(id:String, message:String, sender:String, ia:Bool){
        self.init();
        self.set(id: id, message: message, sender: sender, ia:ia);
    }
    func set(id:String, message:String, sender:String, ia:Bool){
        self.id=id;
        self.message=message;
        self.sender=sender;
        self.isArchived=ia;
    }
    func SendMessage(fbCustom:FirebaseCustom, name:String, completionHandler: @escaping (Any?, Error?) -> ()){
        var db=Database.database().reference().child("Inbox").child(name);
        var data:[String:Any]=["isArchived":false, "message":self.message, "sender": self.sender];
        fbCustom.InsertData(data: data, db:db, completionHandler: {
            (resp, error) in
            print(resp);
            if error==nil{
                completionHandler(resp, nil);
            }else{
                completionHandler(nil, error);
            }
        })
    }
    func Empty(){
        self.set(id: "", message: "", sender: "", ia: false);
    }
    static func Setup(dict:Dictionary<String, Any>, name:String)->ChatViewModel{
//        var dict=response.value as! Dictionary<String, Any>;
        let stemp=ChatViewModel();
        stemp.set(id: name as! String, message: dict["message"] as! String, sender: dict["sender"] as! String, ia: false);
        return stemp;
    }
    
    
    
}
