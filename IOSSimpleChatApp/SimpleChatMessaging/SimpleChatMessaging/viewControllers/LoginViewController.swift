//
//  LoginViewController.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import SVProgressHUD;

class LoginViewController: UIViewController {
    @IBOutlet weak var UIEmail: UITextField!
    @IBOutlet weak var UIPassword: UITextField!
    @IBOutlet weak var UIErrorLabel: UILabel!
    
    var fbCustom:FirebaseCustom?;
    override func viewDidLoad(){
        super.viewDidLoad()
        self.fbCustom=FirebaseCustom();
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnLoginClick(_ sender: Any) {
        self.fbCustom?.userInfo?.set(email: self.UIEmail.text!, pass: self.UIPassword.text!);
        self.fbCustom?.AuthUser(completionHandler: {
            (response, error) in
            if error==nil{
                self.performSegue(withIdentifier: "loginToDashboard", sender: sender);
            }else{
                self.UIErrorLabel.text=error?.localizedDescription;
                self.UIErrorLabel.alpha=1;
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginToDashboard"{
            let destVC=segue.destination as! DashboardViewController
            destVC.userLoginInfo=self.fbCustom?.userInfo;
        }
    }
    
}
