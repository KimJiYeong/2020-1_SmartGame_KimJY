//
//  ViewController.swift
//  HospitalMap
//
//  Created by KpuGame on 2020/05/15.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//
/*
 할일 정리
 
 */


import UIKit
class ViewController: UIViewController{
  
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetUser()
        print("reset all data")
        
    }
    fileprivate func resetUser()
    {
        CoreDataManager.shared.resetUser() {
            onSuccess in print("reset")
        }
        
    }

}

