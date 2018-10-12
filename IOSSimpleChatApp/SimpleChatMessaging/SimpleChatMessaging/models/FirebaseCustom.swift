//
//  FirebaseCustom.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import Firebase

class FirebaseCustom{
    public var userInfo:UserInfo?;
    init(){
        self.userInfo=UserInfo();
    }
    func createUser(completionHandler: @escaping (Any?, Error?) -> ()){
        Auth.auth().createUser(withEmail: (self.userInfo?.Email)!, password: (self.userInfo?.Password)!, completion: {
            (user, error) in
            if error==nil{
                //success user created
                completionHandler(user, nil);
            }else{
                //print error
                completionHandler(nil, error);
            }
        })
    }
    func AuthUser(completionHandler: @escaping (Any?, Error?) -> ()){
        Auth.auth().signIn(withEmail: (self.userInfo?.Email)!, password: (self.userInfo?.Password)!, completion: {
            (response, error) in
            if error==nil{
                completionHandler(response, nil);
            }else{
                print("Auth Error!");
                print(error!);
                completionHandler(nil, error);
            }
        })
    }
    
}



