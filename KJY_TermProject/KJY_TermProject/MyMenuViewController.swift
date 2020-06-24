//
//  MyMenuViewController.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/13.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import UIKit

class MyMenuViewController: UIViewController {

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var TimeLable: UILabel!
    @IBOutlet weak var ReveuneLabel: UILabel!
    @IBOutlet weak var ImageLabel: UIImageView!
    @IBOutlet weak var DePict: UILabel!
    @IBOutlet weak var paraNoLabel: UILabel!
    var paramText1 : String? ; var paramText2 : String?
    @IBOutlet weak var memoLabel: UITextView!
    var timerLabelText : String?
    var temp_paraNoArray : [String]?
    var temp_StoreNameArray : [String]?
    var mymenu = Mymenu()
    var paramEmail : String = ""
    var paramRevenue : String = ""
    var paramTime : String = ""
    var paramImage : UIImage!
    var paraDicpic : String = ""
    override func viewDidLoad() {
        getAllUsers()
        TimeLable.text = timerLabelText
        self.memoLabel.text = paramEmail
        super.viewDidLoad()
        //데이터 변환
        TitleLabel.text = paramText1
        paraNoLabel.text = paramText2
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func doneToStopWatch(segue: UIStoryboardSegue)
      {
        self.TimeLable.text = paramTime
      }
    @IBAction func doneToSelectName(segue: UIStoryboardSegue)
         {
            self.TitleLabel.text = paramText1
            self.paraNoLabel.text = paramText2
         }
    @IBAction func doneToRevenueMoney(segue: UIStoryboardSegue)
         {
            self.ReveuneLabel.text = paramRevenue + "만원"
             print("Revenue view return")
         }
    @IBAction func doneToImageView(segue: UIStoryboardSegue)
            {
                print("image view return")
                self.ImageLabel.image = paramImage
                self.DePict.text = paraDicpic
            }
    @IBAction func doneToMemoView(segue: UIStoryboardSegue)
            {
                print("memo view return")
                print("paraEmail - \(paramEmail)")
                 self.memoLabel.text = paramEmail
            }
 
    // MARK: - data source
       fileprivate func getAllUsers() {
           let users: [Users] = CoreDataManager.shared.getUsers()
           let userNames: [String] = users.map({$0.name!})
           print("allUsers = \(userNames)")
           let userStoreNames : [String] = users.map({$0.storename!})
           print("allUsers = \(userStoreNames)")
           // data parsing을 위해 coredata에 저장된 값을 temp로 복사함
           temp_paraNoArray = userNames
           temp_StoreNameArray = userStoreNames
          
           print("users count -> \(users.count)")
           //        let userDevices: [String]? = users.filter({$0.name == "Danny"}).first?.devices
           
       }
       
}
