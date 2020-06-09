//
//  StoreTableViewController.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/09.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import UIKit

class StoreTableViewController: UITableViewController, XMLParserDelegate {

    @IBOutlet var tbData: UITableView!
    
    var url : String?
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var yadmNm = NSMutableString()
    var addr = NSMutableString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()

    }

      // MARK: - Parser
        
    func beginParsing() {
        posts = []
        parser = XMLParser(contentsOf: (URL(string: url!))!)!
        parser.delegate = self
        parser.parse()
        tbData!.reloadData()
    }
    
  func parser(_ parser:XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName : String?, attributes attributeDice: [String: String])
    {
        element = elementName as NSString
        
        if (elementName as NSString).isEqual(to: "item")
        {
            elements = NSMutableDictionary()
            elements = [:]
            yadmNm = NSMutableString()
            yadmNm = ""
            addr = NSMutableString()
            addr = ""
           
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "mainTrarNm")
        {
            yadmNm.append(string)
        }
        else if element.isEqual(to: "ctprvnNm")
        {
            addr.append(string)
        }
       
    }
    
    //피드 데이터를 딕서너리에 저장
      func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
          if (elementName as NSString).isEqual(to: "item")
          {
              if !yadmNm.isEqual(nil)
              {
                  elements.setObject(yadmNm, forKey: "mainTrarNm" as NSCopying)
              }
              if !addr.isEqual(nil) {
                  elements.setObject(addr, forKey: "ctprvnNm" as NSCopying)
              }

              posts.add(elements)
          }
      }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "mainTrarNm") as! NSString as String
        cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "ctprvnNm") as! NSString as String

        return cell
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


}
