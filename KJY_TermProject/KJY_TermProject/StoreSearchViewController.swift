//
//  ViewController.swift
//  HospitalMap
//
//  Created by KpuGame on 2020/05/15.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//
//상권 검색 코드 - 병원정보 코드 참고해서 좀 더 구성해야할 듯
import UIKit
class StoreSearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
  
  
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func doneToStoreSearchViewContorller(segue: UIStoryboardSegue)
    {
        
    }
    
    var pickerDataSource = ["광진구", "구로구", "동대문구", "종로구"]
    var url : String = "http://apis.data.go.kr/B553077/api/open/sdsc?ServiceKey=d1dnU5KOcFu3kxN0WqezfuNwFhRQbxC1WsHisyn3peY%2FOnnDX5yEoSBr10CoTjvj46PevWSgiJTwhdAm%2FJPTxw%3D%3D&"
    var sgguCd : String = "110023" //디폴트 시군구 코드 - 광진구
    
    
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
            sgguCd = "110023" //광진구
        }
        else if row == 1 {
            sgguCd = "110005" //구로구
        }
        else if row == 2 {
            sgguCd = "110007" //동대문구
        }
        else //==3==
        {
            sgguCd = "110016" //종로구 코드
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueToStoreSearchTableView" {
            if let navController = segue.destination as? UINavigationController {
                if let storeTableViewController = navController.topViewController as? StoreTableViewController {
                    storeTableViewController.url = url + sgguCd
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

