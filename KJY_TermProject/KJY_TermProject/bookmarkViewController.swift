//
//  bookmarkViewController.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/24.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import UIKit

class bookmarkViewController: UIViewController, XMLParserDelegate {
    
    @IBOutlet weak var temp_paranum1: UILabel!
    @IBOutlet weak var temp_paranum2: UILabel!
    @IBOutlet weak var temp_paraname1: UILabel!
    @IBOutlet weak var temp_paraname2: UILabel!
    
    var temp_paraNoArray : [String]?
    var paramurl : String?
    var url : String?
    var parser = XMLParser()
    var posts = NSMutableArray()
    
    var taraNo : [NSMutableStringing()] = "" //상권번호
    var mainTrarNo : [String] = NSMutableString() //상권명
   var elements  = NSMutableDictionary()
    var element : [String] = NSString()
    var sUrl : [String] = SearchURL()


    override func viewDidLoad() {
        super.viewDidLoad()
        getAllUsers()
        // Do any additional setup after loading the view.
        //self.url = paramurl
        print("temp -  \(String(describing: temp_paraNoArray?[0]))")
       
        
        //url create
        self.url = self.sUrl.returnDetailURL(v_trarNo: temp_paraNoArray![0])
        //parsing start
        print("url : \(url)")
        beginParsing()
        reMatch()
        
    }
    fileprivate func getAllUsers() {
           let users: [Users] = CoreDataManager.shared.getUsers()
           let userNames: [String] = users.map({$0.name!})
           print("allUsers = \(userNames)")
// data parsing을 위해 coredata에 저장된 값을 temp로 복사함
        temp_paraNoArray = userNames
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - Parser
       
       func beginParsing() {
           posts = []
           parser = XMLParser(contentsOf: (URL(string: url!))!)!
           parser.delegate = self
           parser.parse()
           
       }
    
    func parser(_ parser:XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName : String?, attributes attributeDice: [String: String])
       {
           element = elementName as NSString
           
           if (elementName as NSString).isEqual(to: "item")
           {
               elements = NSMutableDictionary()
               elements = [:]
               taraNo = NSMutableString() //상권번호
               taraNo = ""
               mainTrarNo = NSMutableString() //상권명
               mainTrarNo = ""
           }
       }
       
       func parser(_ parser: XMLParser, foundCharacters string: String)
       {
           if element.isEqual(to: "mainTrarNm")
           {
               mainTrarNo.append(string)
           }
           else if element.isEqual(to: "trarNo")
           {
               taraNo.append(string)
           }
         
       }
    
    func reMatch(){
        temp_paranum1.text = taraNo as String
        temp_paraname1.text = mainTrarNo as String
    }
}
extension bookmarkViewController : UITableViewDelegate {
    
}
