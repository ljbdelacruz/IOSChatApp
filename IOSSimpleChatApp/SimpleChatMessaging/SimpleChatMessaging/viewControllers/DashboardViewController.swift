//
//  DashboardViewController.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import SVProgressHUD

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var UIRooms: UITableView!
    var fbCustom:FirebaseCustom?;
    var crlist:ChatRoomList=ChatRoomList();
    
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden=true;
        super.viewDidLoad()
        self.UIRooms.delegate=self;
        self.UIRooms.dataSource=self;
        //registering the customCell1 of tableView
        //nibName=fileName.xib, forCellReuseIdent: identifier for the UITableViewCell
        self.UIRooms.register(UINib(nibName: "customCell1", bundle: nil), forCellReuseIdentifier: "customCell1");
        self.configureTableView();
        self.crlist.FetchFirebaseData(fb: self.fbCustom!, completionHandler: {
            (data) in
            //if success fetching data todo
            //adjust cell based on the content
            self.configureTableView();
            //reload data in tables to update that there is a new content
            self.UIRooms.reloadData();
        });
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.crlist.list.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=self.UIRooms.dequeueReusableCell(withIdentifier: "customCell1", for: indexPath) as! CustomCell1TableViewCell;
        cell.UITitle.text=self.crlist.list[indexPath.row].RoomName;
    cell.UIDefaultMessage.text=self.crlist.list[indexPath.row].chatContent[self.crlist.list[indexPath.row].chatContent.count-1].message;
        cell.UIProfileImage.image=UIImage(named: "img1.jpg");
        return cell;
    }
    func configureTableView(){
        self.UIRooms.rowHeight=UITableViewAutomaticDimension;
        self.UIRooms.estimatedRowHeight=120.0;
    }
    var selectedCR:ChatRoomViewModel?;
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.selectedCR=self.crlist.list[indexPath.row];
        performSegue(withIdentifier: "dashboardToChat", sender: nil);
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dashboardToChat"{
            let destVC=segue.destination as! ChatViewController
            destVC.crVM=self.selectedCR;
            destVC.fbCustom=self.fbCustom;
        }
    }
    @IBAction func OnLogoutClick(_ sender: Any) {
        SVProgressHUD.show()
        self.fbCustom?.Logout(completionHandler: {
            (isSuccess) in
            SVProgressHUD.dismiss()
            if isSuccess{
                self.navigationController?.popToRootViewController(animated: true)
            }
        })
    }
    
    
}
