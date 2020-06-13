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
    
    var timerLabelText : String?
    
    var mymenu = Mymenu()
    
    override func viewDidLoad() {
        TimeLable.text = timerLabelText
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func doneToStopWatch(segue: UIStoryboardSegue)
      {
          
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
