//
//  SignupViewController.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import Firebase;
import SVProgressHUD

class SignupViewController: UIViewController {

    @IBOutlet weak var UIEmail: UITextField!
    @IBOutlet weak var UIName: UITextField!
    @IBOutlet weak var UIPassword: UITextField!
    @IBOutlet weak var UIRPassword: UITextField!
    @IBOutlet weak var UIerrorLabel: UILabel!
    
    var fbCustomObj:FirebaseCustom?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fbCustomObj=FirebaseCustom();
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnSignUpClick(_ sender: Any){
        SVProgressHUD.show();
        self.fbCustomObj?.userInfo?.set(email: self.UIEmail.text!, pass: self.UIPassword.text!);
        if(self.fbCustomObj?.userInfo?.CheckData(repass: self.UIRPassword.text!))!{
            self.fbCustomObj?.createUser(completionHandler: {(result, error) in
                SVProgressHUD.dismiss()
                if error==nil{
                    print(result!);
                    self.performSegue(withIdentifier: "signUpToDashboard", sender: sender);
                }else{
                    print(error!);
                    self.UIerrorLabel.text=error?.localizedDescription;
                    self.UIerrorLabel.alpha=1;
                }
            })
        }else{
            print("Please check the data you entered!");
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "signUpToDashboard"{
            let destVC=segue.destination as! DashboardViewController;
            destVC.fbCustom=self.fbCustomObj;
        }
    }
    
    
    

}
