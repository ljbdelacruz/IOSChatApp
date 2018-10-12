//
//  UserInfo.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation

class UserInfo{
    public var Email, Password:String
    init(){
        self.Email="";
        self.Password="";
    }
    convenience init(email:String, pass:String){
        self.init();
        self.set(email: email, pass: pass)
    }    
    func set(email:String, pass:String){
        self.Email=email;
        self.Password=pass;
    }
    func CheckData(repass:String)->Bool{
        if(self.Password == repass){
            if(self.Email != "" && self.Password != ""){
                return true;
            }
        }
        return false;
    }
    
}
