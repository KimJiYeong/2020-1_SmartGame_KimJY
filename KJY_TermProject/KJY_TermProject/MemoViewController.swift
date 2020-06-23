//
//  MemoViewController.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/23.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {
    
    @IBOutlet weak var memoViewController: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    var text2 : String = "123"
    @IBAction func onPerformSegue(_ sender: Any) {
        
        self.performSegue(withIdentifier: "memounwindsegue", sender: self)
        
    }
    @IBAction func Submit(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination
        guard let rvc = dest as? MyMenuViewController else { return }
        rvc.paramEmail = self.memoViewController.text!
    }
    
   
    
}
