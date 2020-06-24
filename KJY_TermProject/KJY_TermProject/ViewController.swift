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
        getAllUsers()
        resetUser()
        //*수동 삭제//
        
        for i in stride(from: 0, to: 40, by: 1) {
            deleteUser(Int64(i))
          
        }
        
        getAllUsers()
        print("reset all data")
        
    }
      fileprivate func getAllUsers() {
               let users: [Users] = CoreDataManager.shared.getUsers()
               let userNames: [String] = users.map({$0.name!})
                print("allUsers = \(userNames)")
       
        
        print("users count -> \(users.count)")
       // data parsing을 위해 coredata에 저장된 값을 temp로 복사함
         
    //        let userDevices: [String]? = users.filter({$0.name == "Danny"}).first?.devices
           }
    fileprivate func resetUser()
    {
        CoreDataManager.shared.resetUser() {
            onSuccess in print("reset")
        }
       
        
    }
    fileprivate func deleteUser(_ id: Int64) {
           CoreDataManager.shared.deleteUser(id: id) { onSuccess in
               print("deleted = \(onSuccess)")
           }
       }
}

