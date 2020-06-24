//
//  ManiMenuViewController.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/24.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import UIKit

class ManiMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func Bt_On_Bookmark(_ sender: Any) {
        
    }
    var t : String = "12345"
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let dest = segue.destination
            guard let rvc = dest as? bookmarkViewController else { return }
            rvc.paramurl = self.t
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
