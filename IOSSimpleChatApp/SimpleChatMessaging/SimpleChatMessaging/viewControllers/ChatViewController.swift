//
//  ChatViewController.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit


class ChatViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var UINavbar: UINavigationItem!
    @IBOutlet weak var UIRoomLabel: UILabel!
    @IBOutlet weak var UIMessageText: UITextField!
    @IBOutlet weak var UISendButton: UIButton!
    @IBOutlet weak var UIHeightContraints: NSLayoutConstraint!
    @IBOutlet weak var UIMessages: UITableView!
    var crVM:ChatRoomViewModel?;
    var fbCustom:FirebaseCustom?;
    var message:ChatViewModel?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.UINavbar.title=self.crVM!.RoomName;
        self.navigationController?.isNavigationBarHidden=false;
        self.message=ChatViewModel();
        // Do any additional setup after loading the view.
        self.UIMessageText.delegate=self;
        //assign delegate
        self.UIMessages.delegate=self;
        self.UIMessages.dataSource=self;
        self.UIMessages.register(UINib(nibName: "customCell1", bundle: nil), forCellReuseIdentifier: "customCell1");
        self.configureTableView();
        
        //tap gestures
        //#sign for triggering selector
        let tapGesture=UITapGestureRecognizer(target: self, action:#selector(self.OutsideTappedEditing))
        self.UIMessages.addGestureRecognizer(tapGesture);
        self.UIRoomLabel.text=self.crVM!.RoomName;
        self.message?.sender=self.fbCustom!.userInfo!.Email;
        
        
        self.crVM?.chatContent=[];
        self.crVM?.FetchConversation(fbCustom: self.fbCustom!, name: (self.crVM?.RoomName)!, completionHandler: {
            (response) in
            self.configureTableView();
            //reload data in tables to update that there is a new content
            self.UIMessages.reloadData();
        })
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func OnSendClick(_ sender: Any) {
        self.OutsideTappedEditing();
        self.UISendButton.isEnabled=false;
        self.UIMessageText.isEnabled=false;
        self.message?.sender=self.fbCustom!.userInfo!.Email;
        self.message?.message=self.UIMessageText.text!;
        self.message?.SendMessage(fbCustom: self.fbCustom!, name: self.crVM!.RoomName, completionHandler: {
            (resp, error) in
            if error == nil{
                self.UISendButton.isEnabled=false;
                self.UIMessageText.isEnabled=false;
                self.UIMessageText.text="";
                self.crVM?.chatContent.append(self.message!);
                self.message?.Empty();
                self.message?.sender=self.fbCustom!.userInfo!.Email;
            }
        })
    }
    
    //textFieldFunctionalities
    func textFieldDidBeginEditing(_ textField: UITextField){
        UIView.animate(withDuration: 0.5, animations: {
            //Changes the height of the UIView so that it can be seen when keyboard shows up
            self.UIHeightContraints.constant=308;
            self.view.layoutIfNeeded();
        })
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5, animations: {
            self.UIHeightContraints.constant=59;
            //updates the UI if there is changes
            self.view.layoutIfNeeded();
        })
    }
    //tableViewTapped here, when setting action function must add @objc #selector
    @objc func OutsideTappedEditing(){
        //manually end editing so that it will execute tfDidEndEdit method
        self.UIMessageText.endEditing(true);
    }
    //TableView
    func configureTableView(){
        self.UIMessages.rowHeight=UITableViewAutomaticDimension;
        self.UIMessages.estimatedRowHeight=120.0;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.crVM!.chatContent.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=self.UIMessages.dequeueReusableCell(withIdentifier: "customCell1", for: indexPath) as! CustomCell1TableViewCell;
        cell.UITitle.text=self.crVM?.chatContent[indexPath.row].sender;
        cell.UIDefaultMessage.text=self.crVM?.chatContent[indexPath.row].message;
        return cell;
    }
    
    
    
    
}
