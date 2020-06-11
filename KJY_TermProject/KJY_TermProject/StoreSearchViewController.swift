//
//  ViewController.swift
//  HospitalMap
//
//  Created by KpuGame on 2020/05/15.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//
//상권 검색 코드 - 병원정보 코드 참고해서 좀 더 구성해야할 듯
//코드 내에서 데이터 저장한뒤에 그 데이터 내에서 저장해서 불러오던지 vs 어떻게든 코드 읽는거 알아오던지 2개인듯
import UIKit
class StoreSearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
  
  
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func doneToStoreSearchViewContorller(segue: UIStoryboardSegue)
    {
        
    }
    //상권 정보 url
    /*
     상권 정보 URL
     http://apis.data.go.kr/B553077/api/open/sdsc/storeZoneOne?serviceKey=d1dnU5KOcFu3kxN0WqezfuNwFhRQbxC1WsHisyn3peY%2FOnnDX5yEoSBr10CoTjvj46PevWSgiJTwhdAm%2FJPTxw%3D%3D&
     */
    
    var pickerDataSource = ["서울특별시", "인천광역시", "부산광역시", "대구광역시"]
 
    var sgguCd : String = "110023" //디폴트 시군구 코드 - 광진구
    var key : Int = 0

    
    
    func returnURL(ctprvnCD: Int) -> String?
    {
        let api : String = "http://apis.data.go.kr/B553077/api/open/sdsc/storeZoneInAdmi?"
        let serKey : String = "&ServiceKey=d1dnU5KOcFu3kxN0WqezfuNwFhRQbxC1WsHisyn3peY%2FOnnDX5yEoSBr10CoTjvj46PevWSgiJTwhdAm%2FJPTxw%3D%3D"
       //let url : String  = api + "divId=ctprvnCd&" + "key=" + ctprvnCD + "&" + serKey
        var url : String = ""
        url = api
        url += "divId=ctprvnCd&"
        url += ("key=" + String(ctprvnCD))
        url += serKey
        return url
    }


    // MARK: - Table view data source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component : Int) -> String? {
        return pickerDataSource[row]
    }
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            key = 11 //광진구
        }
        else if row == 1 {
            key = 28 //구로구
        }
        else if row == 2 {
            key = 26 //동대문구
        }
        else //==3==
        {
            key = 27 //종로구 코드
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueToStoreSearchTableView" {
            if let navController = segue.destination as? UINavigationController {
                if let storeTableViewController = navController.topViewController as? StoreTableViewController {
                    storeTableViewController.url = returnURL(ctprvnCD: key)
                }
            }
        }

      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
    
        
    }


}

