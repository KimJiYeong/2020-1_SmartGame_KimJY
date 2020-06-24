//
//  bookmarkTableViewController.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/24.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import UIKit

class bookmarkTableViewController: UITableViewController {
    
    var temp_paraNoArray : [String]?
    var temp_StoreNameArray : [String]?
    var loopcount : Int = 0
    var elements = NSMutableDictionary()
    var element = NSString()
    var rvc_posts = NSMutableArray()
    var posts = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAllUsers()
        
        
        //url create
        //self.url = self.sUrl.returnStoreZoneOneURL(v_trarNo: temp_paraNoArray![0] )
        
        for i in stride(from: 0, to: (loopcount), by: 1)
        {
            //값이 덫씌어지는 버그 발생
            
            elements.setObject(temp_paraNoArray![i], forKey: "taraNo" as NSCopying)
            elements.setObject(temp_StoreNameArray![i], forKey: "StoreName" as NSCopying)
            posts.add(elements) //posts에 정보를더한다.

        }
      
        
    }
    // MARK: - data source
    fileprivate func getAllUsers() {
        let users: [Users] = CoreDataManager.shared.getUsers()
        let userNames: [String] = users.map({$0.name!})
        print("allUsers = \(userNames)")
        let userStoreNames : [String] = users.map({$0.storename!})
        print("allUsers = \(userStoreNames)")
        // data parsing을 위해 coredata에 저장된 값을 temp로 복사함
        temp_paraNoArray = userNames
        temp_StoreNameArray = userStoreNames
        loopcount = users.count
        print("users count -> \(users.count)")
        //        let userDevices: [String]? = users.filter({$0.name == "Danny"}).first?.devices
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text =  temp_StoreNameArray![indexPath.row]
        cell.detailTextLabel?.text = temp_paraNoArray![indexPath.row]
        
        return cell

    }
    
    
    
}
