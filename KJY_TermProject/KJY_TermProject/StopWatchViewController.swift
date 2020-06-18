//
//  StopWatchViewController.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/13.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {

    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var pause: UIButton!
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var lastTime: UILabel!
    @IBOutlet weak var middleTime: UILabel!
    @IBOutlet weak var firstTime: UILabel!
    
    var ToggleButton : Bool = false
    var isStop : Bool = false
    var isSaveButtonPush : Bool = false
    
    @IBOutlet weak var DoneButton: UIBarButtonItem!
    @IBAction func DoneAction(_ sender: Any) {
        //self.performSegue(withIdentifier: "doneToStopWatchWithSegue", sender: self)
        
            
    }
     override func prepare(for segue: UIStoryboardSegue, sender: Any?)
     {
        let myMenuViewController = segue.destination as! MyMenuViewController

        myMenuViewController.timerLabelText = saveTime()
            
            
        }


    @IBAction func StartAction(_ sender: Any) {
        if(!ToggleButton){
            seconds = 0
            min = 0
            mil_sec = 0
            
            lastTime.text = "\(min/10)\(min%10)"
            middleTime.text = "\(seconds/10)\(seconds%10)"
            firstTime.text = "\(mil_sec%1000)"
            
            ToggleButton = true
           
            }
            else{
             //1초마다 substractTime
            start.setTitle("START", for: UIControl.State.normal)//다시 시작하다, 일시정지 해제
                
             ToggleButton = false
            }
            timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(self.substractTime), userInfo: nil, repeats: true)
        //save를 false로 돌림
        isSaveButtonPush = false
    }
    @IBAction func PauseAction(_ sender: Any) {
        isStop = true
        timer.invalidate()
        start.setTitle("RESUME", for: UIControl.State.normal)//다시 시작하다, 일시정지 해제
     isSaveButtonPush = false
    }
    @IBAction func ResetAction(_ sender: Any) {
      seconds = 0
        min = 0
        mil_sec = 0
        timer.fire()
        lastTime.text = "\(min/10)\(min%10)"
        middleTime.text = "\(seconds/10)\(seconds%10)"
        firstTime.text = "\(mil_sec%1000)"
        isSaveButtonPush = false
        start.setTitle("START", for: UIControl.State.normal)//다시 시작하다, 일시정지 해제
                     
    }
    func saveTime() -> String {
           var allTimerLabel : String = ""
        allTimerLabel += firstTime.text! + ":"
         allTimerLabel += middleTime.text! + ":"
         allTimerLabel += lastTime.text!
        return allTimerLabel
    }
    
    @IBAction func SaveAction(_ sender: Any) {
        saveTime()
        
        isSaveButtonPush = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
     var timer = Timer()
      var seconds : Int = 0
      var min : Int = 0
      var mil_sec: Int = 0
      let interval : Double = 0.1
      
    
      @objc func substractTime () {
          mil_sec += 100
          seconds = mil_sec/1000
          min = seconds/60
         
            lastTime.text = "\(min/10)\(min%10)"
            middleTime.text = "\(seconds/10)\(seconds%10)"
            firstTime.text = "\(mil_sec%1000)"
                         
          if(seconds == 0){
             
          }
      
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

