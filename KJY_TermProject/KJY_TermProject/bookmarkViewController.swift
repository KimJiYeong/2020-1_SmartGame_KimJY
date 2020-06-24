//
//  bookmarkViewController.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/24.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import UIKit

class bookmarkViewController: UIViewController, XMLParserDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var temp_paranum1: UILabel!
    @IBOutlet weak var temp_paranum2: UILabel!
    @IBOutlet weak var temp_paraname1: UILabel!
    @IBOutlet weak var temp_paraname2: UILabel!
    @IBOutlet weak var bookmarkingNum: UILabel!
    
    var temp_paraNoArray : [String]?
    var temp_StoreNameArray : [String]?
    var paramurl : String?
    var url : String?
    var parser = XMLParser()
    var posts = NSMutableArray()
    
    var taraNo = NSMutableString() //상권번호
    var mainTrarNo = NSMutableString() //상권명
    var elements = NSMutableDictionary()
    var element = NSString()
    var sUrl = SearchURL()

    var loopcount : Int = 0
    var param_loopcount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllUsers()
        
        
        //url create
        //self.url = self.sUrl.returnStoreZoneOneURL(v_trarNo: temp_paraNoArray![0] )
       
        for i in stride(from: 0, to: (loopcount), by: 1)
        {
            elements.setObject(temp_paraNoArray![i], forKey: "taraNo" as NSCopying)
            elements.setObject(temp_StoreNameArray![i], forKey: "StoreName" as NSCopying)
        
        posts.add(elements) //posts에 정보를더한다.
        }
      
        reMatch()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let dest = segue.destination
            guard let rvc = dest as? bookmarkTableViewController else { return }
            rvc.rvc_posts  = self.posts
        }
    
    
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
    
    
    func reMatch(){
        temp_paranum1.text = taraNo as String
        temp_paraname1.text = mainTrarNo as String
        bookmarkingNum.text = String(loopcount) as String
    }

}

