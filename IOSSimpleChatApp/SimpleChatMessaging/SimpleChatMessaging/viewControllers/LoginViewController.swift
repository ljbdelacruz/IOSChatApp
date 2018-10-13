//
//  LoginViewController.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

//login: a@gmail.com/pass123

import UIKit
import SVProgressHUD;

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var UIEmail: UITextField!
    @IBOutlet weak var UIPassword: UITextField!
    @IBOutlet weak var UIErrorLabel: UILabel!
    @IBOutlet weak var UIDoneBtn: UIButton!
    @IBOutlet weak var UILoginBtn: UIButton!
    @IBOutlet weak var UISignUpBtn: UIButton!
    
    
    var fbCustom:FirebaseCustom?;
    override func viewDidLoad(){
        super.viewDidLoad()
        self.fbCustom=FirebaseCustom();
        // Do any additional setup after loading the view.
        self.UIEmail.delegate=self;
        self.UIPassword.delegate=self;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func OnLoginClick(_ sender: Any) {
        SVProgressHUD.show();
        self.ToggleInput();
        self.fbCustom?.userInfo?.set(email: self.UIEmail.text!, pass: self.UIPassword.text!);
        self.fbCustom?.AuthUser(completionHandler: {
            (response, error) in
            if error==nil{
                SVProgressHUD.dismiss();
                self.performSegue(withIdentifier: "loginToDashboard", sender: sender);
            }else{
                self.UIErrorLabel.text=error?.localizedDescription;
                self.UIErrorLabel.alpha=1;
            }
            self.ToggleInput();
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginToDashboard"{
            let destVC=segue.destination as! DashboardViewController
            destVC.fbCustom=self.fbCustom;
        }
    }
    
    @IBAction func DoneOnClick(_ sender: Any) {
        self.CloseKeyboard()
        self.UIDoneBtn.alpha=0;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        self.UIDoneBtn.alpha=1;
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    func ToggleInput(){
        self.UIPassword.isEnabled = !self.UIPassword.isEnabled;
        self.UIEmail.isEnabled = !self.UIEmail.isEnabled;
        self.UILoginBtn.isEnabled = !self.UILoginBtn.isEnabled;
        self.UISignUpBtn.isEnabled = !self.UISignUpBtn.isEnabled;
    }
    func CloseKeyboard(){
        self.UIEmail.endEditing(true);
        self.UIPassword.endEditing(true);
    }
    
}
