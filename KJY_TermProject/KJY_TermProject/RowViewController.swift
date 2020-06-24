//
//  DetailStoreWideViewController.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/11.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import UIKit

class RowViewController: UIViewController, XMLParserDelegate {
    
    
   
    @IBOutlet weak var trarNoLabel: UILabel!
    @IBOutlet weak var ctprvnNmLabel: UILabel!
    @IBOutlet weak var signguNmLabel: UILabel!
    @IBOutlet weak var trarAreaLabel: UILabel!
    @IBOutlet weak var stdrDtLabel: UILabel!
    
    @IBOutlet weak var storeName: UILabel!
    var url : String?
    var temp : String?
    // MARK: - var
    var param_taraNo : String? //값을 전달해줄 String
     var param_StoreName : String? //값을 전달해줄 String
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var yadmNm = NSMutableString()
    var addr = NSMutableString()
    //이전 페이지에서 상권 번호를 받아옴
    var temp_taraNo = NSMutableString()//데이터 변경을 막기 위한 임시 상권번호 변수
    var taraNo = NSMutableString() //상권번호
    var mainTrarNo = NSMutableString() //상권명
    var ctprvnNm = NSMutableString() //시도명
    var signguNm = NSMutableString() // 시군구명
    var trarArea = NSMutableString() //면적
    var stdrDt = NSMutableString() // 데이터 기준 일자
    var indsSclsNm = NSMutableString() //상권업종소분류명
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
        reMatch()
        //deleteUser(1);
        
    }
    
    // MARK: - Parser
    
    func beginParsing() {
        posts = []
        print("\(url)")
        parser = XMLParser(contentsOf: (URL(string: url!))!)!
        parser.delegate = self
        parser.parse()
        
        // tbData!.reloadData()
        temp_taraNo = taraNo
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
            
            taraNo = NSMutableString() //상권번호
            taraNo = ""
            mainTrarNo = NSMutableString() //상권명
            mainTrarNo = ""
            ctprvnNm = NSMutableString() //시도명
            ctprvnNm = ""
            signguNm = NSMutableString() // 시군구명
            signguNm = ""
            trarArea = NSMutableString() //면적
            trarArea = ""
            stdrDt = NSMutableString() // 데이터 기준 일자
            stdrDt = ""
            indsSclsNm = NSMutableString() // 데이터 기준 일자
            indsSclsNm = ""
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
        else if element.isEqual(to: "ctprvnNm")
        {
            ctprvnNm.append(string)
        }
        else if element.isEqual(to: "signguNm")
        {
            signguNm.append(string)
            
        }
        else if element.isEqual(to: "trarArea")
        {
            trarArea.append(string)
            
        }
        else if element.isEqual(to: "stdrDt")
        {
            stdrDt.append(string)
            
        }
        else if element.isEqual(to: "indsSclsNm")
        {
            indsSclsNm.append(string)
        }
    }
    
    func reMatch(){
        storeName.text = mainTrarNo as String
        trarNoLabel.text = taraNo as String
        ctprvnNmLabel.text = ctprvnNm as String
        signguNmLabel.text = signguNm as String
        trarAreaLabel.text = trarArea as String
        stdrDtLabel.text = stdrDt as String
    }
    
    // MARK: - Detail View
    var storeAreaName = ""
    
    var sUrl = SearchURL()

    





}
