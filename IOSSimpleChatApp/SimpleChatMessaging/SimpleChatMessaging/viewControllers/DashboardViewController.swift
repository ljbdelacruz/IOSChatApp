//
//  DashboardViewController.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit



class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var UIRooms: UITableView!
    
    var userLoginInfo:UserInfo?;
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden=true;
        super.viewDidLoad()
        self.UIRooms.delegate=self;
        self.UIRooms.dataSource=self;
        //registering the customCell1 of tableView
        //nibName=fileName.xib, forCellReuseIdent: identifier for the UITableViewCell
        self.UIRooms.register(UINib(nibName: "customCell1", bundle: nil), forCellReuseIdentifier: "customCell1");
        self.configureTableView();
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=self.UIRooms.dequeueReusableCell(withIdentifier: "customCell1", for: indexPath) as! CustomCell1TableViewCell;
        let messageArray=["Test Message1","Test Message2","Test Message3"];
        cell.UIDefaultMessage.text=messageArray[indexPath.row];
        return cell;
    }
    func configureTableView(){
        self.UIRooms.rowHeight=UITableViewAutomaticDimension;
        self.UIRooms.estimatedRowHeight=120.0;
    }
    
}
