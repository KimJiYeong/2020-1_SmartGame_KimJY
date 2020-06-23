//
//  MyMenuViewController.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/13.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import UIKit

class MyMenuViewController: UIViewController {

    @IBOutlet weak var TimeLable: UILabel!
    @IBOutlet weak var ReveuneLabel: UILabel!
    
    @IBOutlet weak var memoLabel: UILabel!
    var timerLabelText : String?
    
    var mymenu = Mymenu()
    var paramEmail : String = ""
    var paramRevenue : String = ""
    var paramTime : String = ""
    override func viewDidLoad() {
        TimeLable.text = timerLabelText
        self.memoLabel.text = paramEmail
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func doneToStopWatch(segue: UIStoryboardSegue)
      {
        self.TimeLable.text = paramTime
      }
    @IBAction func doneToRevenueMoney(segue: UIStoryboardSegue)
         {
            self.ReveuneLabel.text = paramRevenue + "만원"
             print("Revenue view return")
         }
    @IBAction func doneToImageView(segue: UIStoryboardSegue)
            {
                print("image view return")
                
            }
    @IBAction func doneToMemoView(segue: UIStoryboardSegue)
            {
                print("memo view return")
                print("paraEmail - \(paramEmail)")
                 self.memoLabel.text = paramEmail
            }
 

}
