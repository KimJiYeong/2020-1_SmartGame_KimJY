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
    
   // var XPos = NSMutableString()
   // var YPos = NSMutableString()
    
    var storeAreaName = ""
    var storeAreaName_utf8 = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()

    }
// MARK: - Detail View
    func returnDetailURL(v_trarNo : String) -> String?
       {
           let api : String = "http://apis.data.go.kr/B553077/api/open/sdsc/storeZoneOne?"
           let serKey : String = "&ServiceKey=d1dnU5KOcFu3kxN0WqezfuNwFhRQbxC1WsHisyn3peY%2FOnnDX5yEoSBr10CoTjvj46PevWSgiJTwhdAm%2FJPTxw%3D%3D"
          //let url : String  = api + "divId=ctprvnCd&" + "key=" + ctprvnCD + "&" + serKey
           var url : String = ""
           url = api
           url += "key="
          url += v_trarNo
           url += serKey
           return url
       }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
      
        if segue.identifier == "segueToStoreDetail" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                storeAreaName = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey: "trarNo") as! NSString as String
                    
                //인덱스 내부에 /t찍히는걸 막아야함
                //1 /가 나오는 순간을 파악함
                
                //그거의 위치를 읽어 offsetBya에 입력함
                let rangeOfWorld = storeAreaName.index(storeAreaName.endIndex, offsetBy: -6)..<storeAreaName.endIndex
                storeAreaName.removeSubrange(rangeOfWorld) // 결과 : Hello
                
                
                storeAreaName_utf8 = storeAreaName.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
                //정상적으로 잘 지워졌는지 확인하기
                for i in storeAreaName {
                    print(i)
                }
                
                if let detailStoreWideViewController = segue.destination as?
                    DetailStoreWideViewController {
                    detailStoreWideViewController.url = returnDetailURL(v_trarNo: storeAreaName)
                }
            }
        }
        
      
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
        else if element.isEqual(to: "trarNo")
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
                  elements.setObject(addr, forKey: "trarNo" as NSCopying)
              }

              posts.add(elements)
          }
      }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "mainTrarNm") as! NSString as String
        cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "trarNo") as! NSString as String

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
