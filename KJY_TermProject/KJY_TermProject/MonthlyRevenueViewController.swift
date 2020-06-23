//
//  MonthlyRevenueViewController.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/23.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import UIKit

class MonthlyRevenueViewController: UIViewController {
    // MARK: - Value
    @IBOutlet weak var RevenueMonthly: UISlider!
    @IBOutlet weak var RevenueRent: UISlider!
    @IBOutlet weak var RevenuePerson: UISlider!
    @IBOutlet weak var RevenueDues: UISlider!
    @IBOutlet weak var RevenueETC: UISlider!
    @IBOutlet weak var outlet_montly: UILabel!
    @IBOutlet weak var outlet_rent: UILabel!
    @IBOutlet weak var outlet_person: UILabel!
    @IBOutlet weak var outlet_dues: UILabel!
    @IBOutlet weak var outlet_etc: UILabel!
    @IBOutlet weak var outlet_total: UILabel!
    var totalRevenue : Int = 0
    // MARK: - Action
    @IBAction func Action_Monthly(_ sender: Any) {
        outlet_montly.text = String(Int(RevenueMonthly.value)) + "만원"
    }
    @IBAction func Action_Rent(_ sender: Any) {
        outlet_rent.text = String(Int(RevenueRent.value)) + "만원"
    }
    @IBAction func Action_Person(_ sender: Any) {
        outlet_person.text = String(Int(RevenuePerson.value)) + "만원"
    }
    @IBAction func Action_Dues(_ sender: Any) {
        outlet_dues.text = String(Int(RevenueDues.value)) + "만원"
    }
    @IBAction func Action_ETC(_ sender: Any) {
        outlet_etc.text = String(Int(RevenueETC.value)) + "만원"
    }
    @IBAction func bt_Caculator(_ sender: Any) {
        totalRevenue = Int(RevenueMonthly.value)
        totalRevenue -= (Int(RevenueRent.value) + Int(RevenuePerson.value) + Int(RevenueDues.value) + Int(RevenueETC.value));
        outlet_total.text = String(totalRevenue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //초기상태 입력
        outlet_montly.text = String(Int(RevenueMonthly.value)) + "만원"
        outlet_rent.text = String(Int(RevenueRent.value)) + "만원"
        outlet_person.text = String(Int(RevenuePerson.value)) + "만원"
        outlet_dues.text = String(Int(RevenueDues.value)) + "만원"
        outlet_etc.text = String(Int(RevenueETC.value)) + "만원"
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
