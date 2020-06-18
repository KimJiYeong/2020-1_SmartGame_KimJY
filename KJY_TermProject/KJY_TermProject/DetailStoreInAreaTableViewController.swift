//
//  DetailStoreInAreaTableViewController.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/11.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import UIKit

class DetailStoreInAreaTableViewController: UITableViewController,XMLParserDelegate {

    @IBOutlet var tbData: UITableView!
        
        var url : String?
        var parser = XMLParser()
        var posts = NSMutableArray()
        var elements = NSMutableDictionary()
        var element = NSString()
        var yadmNm = NSMutableString()
        var addr = NSMutableString()
    
    // MARK: -var
    var indsLclsNm = NSMutableString()
    var indsMclsNm = NSMutableString()
    var addIndsNm = NSString()
       // var XPos = NSMutableString()
       // var YPos = NSMutableString()
        
        var storeAreaName = ""
        var storeAreaName_utf8 = ""
        var lon = NSMutableString()
        var lat = NSMutableString()
    var rdnmAddr = NSMutableString()
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
               indsLclsNm = NSMutableString()
                indsLclsNm = ""
                indsMclsNm = NSMutableString()
                indsMclsNm = ""
                lon = NSMutableString()
                lon = ""
                lat = NSMutableString()
                lat = ""
                rdnmAddr = NSMutableString()
                rdnmAddr = ""
            }
        }
        
        func parser(_ parser: XMLParser, foundCharacters string: String)
        {
            if element.isEqual(to: "bizesNm")
            {
                yadmNm.append(string)
            }
            else if element.isEqual(to: "trarNo")
            {
                addr.append(string)
            }
            else if element.isEqual(to: "indsLclsNm")
            {
                indsLclsNm.append(string)
            }
            else if element.isEqual(to: "indsMclsNm")
             {
                 indsMclsNm.append(string)
             }
           else if element.isEqual(to: "lon")
                      {
                          lon.append(string)
                      }
                      else if element.isEqual(to: "lat")
                       {
                           lat.append(string)
                       }
            else if element.isEqual(to: "rdnmAdr")
            {
                rdnmAddr.append(string)
            }
        }
        
        //피드 데이터를 딕서너리에 저장
          func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
              if (elementName as NSString).isEqual(to: "item")
              {
                  if !yadmNm.isEqual(nil)
                  {
                      elements.setObject(yadmNm, forKey: "bizesNm" as NSCopying)
                  }
                  if !indsLclsNm.isEqual(nil) {
                    
                    
                      elements.setObject(indsLclsNm, forKey: "indsLclsNm" as NSCopying)
                   
                  }
                if !lon.isEqual(nil) {
                    
                    
                      elements.setObject(lon, forKey: "lon" as NSCopying)
                   
                  }
                if !lat.isEqual(nil) {
                    
                    
                      elements.setObject(lat, forKey: "lat" as NSCopying)
                   
                  }
                if !rdnmAddr.isEqual(nil) {
                                 
                                 
                                   elements.setObject(lat, forKey: "rdnmAdr" as NSCopying)
                                
                               }
                  posts.add(elements)
              }
          }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

            // Configure the cell...
            cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "bizesNm") as! NSString as String
            cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "indsLclsNm") as! NSString as String

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueToMapView" {
            if let mapViewController = segue.destination as? StoreInAreaMapViewController {
                mapViewController.posts = posts
            }
        }
    }
    
}
