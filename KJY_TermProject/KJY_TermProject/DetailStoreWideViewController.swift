//
//  DetailStoreWideViewController.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/11.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import UIKit

class DetailStoreWideViewController: UIViewController {

    @IBOutlet weak var DetailArea: UILabel!
    @IBOutlet weak var DetailSedoCode: UILabel!
    @IBOutlet weak var DetailSdoName: UILabel!
    @IBOutlet weak var DetailStoreNum: UILabel!
    @IBOutlet weak var storeName: UILabel!
    
    var url : String?
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var yadmNm = NSMutableString()
    var addr = NSMutableString()
    //이전 페이지에서 상권 번호를 받아옴
    
    override func viewDidLoad() {
        reMatch()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  
    
       // MARK: - Parser
          
      func beginParsing() {
          posts = []
          parser = XMLParser(contentsOf: (URL(string: url!))!)!
         // parser.delegate = self
          parser.parse()
         
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
    
    func reMatch(){
        storeName.text = yadmNm as String
    }

}
