//
//  ViewController.swift
//  black_jack
//
//  Created by KpuGame on 2020/06/08.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import UIKit

//뒤집기 구현했당!

class ViewController: UIViewController {

    //나머지 기능 전부다 구현하면 될듯 일단 숫자 계산하는건 해놨다~
    
    var player: Player = Player(name : "player")
    var dealer: Player = Player(name: "dealer")
    
    var LCardsPlayer = [UIImageView]()
    var LCardsDealer = [UIImageView]()
    
    var deck = [Int]()
    var deckIndex = 0
    
    var VbetMoney : Int = 0
    var VplayerMoney : Int = 1000
    var nCardsDealer : Int = 0
    var nCardsPlayer : Int = 0
    
    @IBOutlet weak var dealerPts: UILabel!
    @IBOutlet weak var playerPts: UILabel!
    @IBOutlet weak var betMoney: UILabel!
    @IBOutlet weak var playerMoney: UILabel!
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var Outlet_Bet50: UIButton!
    @IBOutlet weak var Outlet_Bet25: UIButton!
    @IBOutlet weak var Outlet_Bet10: UIButton!
    @IBOutlet weak var Outlet_Hit: UIButton!
    @IBOutlet weak var Outlet_Stand: UIButton!
    @IBOutlet weak var Outlet_Deal: UIButton!
    @IBOutlet weak var Outlet_Again: UIButton!
    
    @IBAction func Bet50(_ sender: Any) {
        VbetMoney += 50;
        if (VbetMoney <= VplayerMoney){
            betMoney.text = "$\(VbetMoney)"
            VplayerMoney -= 50;
            playerMoney.text = "You have $\(VplayerMoney)";
            
            Outlet_Deal.isEnabled = true;
            audioController.playerEffect(name: SoundChip)
        } else {
            VbetMoney -= 50;
        }
    }
    @IBAction func Bet25(_ sender: Any) {
        VbetMoney += 25;
           if (VbetMoney <= VplayerMoney){
               betMoney.text = "$\(VbetMoney)"
               VplayerMoney -= 25;
               playerMoney.text = "You have $\(VplayerMoney)";
               
               Outlet_Deal.isEnabled = true;
               audioController.playerEffect(name: SoundChip)
           } else {
               VbetMoney -= 25;
        }
    }
    @IBAction func Bet10(_ sender: Any) {
        VbetMoney += 10;
           if (VbetMoney <= VplayerMoney){
               betMoney.text = "$\(VbetMoney)"
               VplayerMoney -= 10;
               playerMoney.text = "You have $\(VplayerMoney)";
               
               Outlet_Deal.isEnabled = true;
               audioController.playerEffect(name: SoundChip)
           } else {
               VbetMoney -= 10;
        }
    }
    
    var audioController : AudioController
    required init?(coder aDecoder: NSCoder) {
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames : AudioEffectFiles)
    
        super.init(coder: aDecoder)
    }
    
    func deal() {
        
        status.text = "Playing...."
        
        deck.shuffle()
        deckIndex = 0
        player.reset()
        dealer.reset()
        
        hitPlayer(n:0) //플레이어 카드 첫번째
        hitPlayer(n:1) // 플레이어 카드 두번쨰
        
        hitDealer(n:0) //딜러ㅏ드 두번째

        if(dealer.value() < 17)
        {
            hitDealer(n:1) //딜러ㅏ드 두번째
            if(dealer.value() < 17)
            {
                hitDealer(n:2) //딜러ㅏ드 두번째
            }
            if(dealer.value() < 17)
              {
                  hitDealer(n:3) //딜러ㅏ드 두번째
              }
        }

        
        hitDealerDown() // 딜러카드 첫번째 뒤집어 놓는다.
        
        nCardsPlayer = 1 //플레이어 카드 놓는 위치 결정하는 변수
        nCardsDealer = 0 //딜러 카드 놓는 위치 결정하는 변수
        
        Outlet_Bet50.isEnabled = false
        Outlet_Bet25.isEnabled = false
        Outlet_Bet10.isEnabled = false
        Outlet_Hit.isEnabled = true
        Outlet_Stand.isEnabled = true
        Outlet_Deal.isEnabled = false
        Outlet_Again.isEnabled = false
        
        
     
    }
    
    func hitPlayer(n: Int) {
        let newCard = Card(temp: deck[deckIndex])
        deckIndex += 1
        
        player.addCard(c: newCard)
        let newImageView = UIImageView ( image: UIImage(named: newCard.filename()))
        newImageView.center = CGPoint(x: 1000, y: 1500)
        
        self.view.addSubview(newImageView)
   
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       animations: {
                        newImageView.center = CGPoint(x:300 + n * 30 , y: 450)
            newImageView.transform = CGAffineTransform(rotationAngle: 3.14)
        }, completion: nil)
    
    
        LCardsPlayer.append(newImageView)
        playerPts.text = "Player " + String(player.value())
        audioController.playerEffect(name: SoundFlip)
    }
    func hitDealerDown() {
        //딜러 카드 이미지를 뒤집은 이미지로 변경함
        LCardsDealer[0].image = UIImage(named:"b2fv")
     }
    func hitDealer(n: Int) {
        
   
            let newCard = Card(temp: deck[deckIndex])
                deckIndex += 1
                dealer.addCard(c: newCard)
            //backcard - 뒤집은 상태의 카드 출력
            //filename - 오픈된 상태의 카드 출력
               let newImageView = UIImageView ( image: UIImage(named: newCard.filename()))
                    newImageView.center = CGPoint(x: 0, y: 0)
                    
                    self.view.addSubview(newImageView)
               
                    UIView.animate(withDuration: 0.5,
                                   delay: 0.0,
                                   animations: {
                                    newImageView.center = CGPoint(x:300 + n * 30 , y: 150)
                        newImageView.transform = CGAffineTransform(rotationAngle: 3.14)
                    }, completion: nil)
                
                
                    LCardsDealer.append(newImageView)
  //  dealerPts.text = "dealer " + String(dealer.value())
         audioController.playerEffect(name: SoundFlip)
    
    
      }
    
    @IBAction func stay(_ sender: Any) {
        //카드를 제출하지 않아요
        checkWinner()
       Outlet_Bet50.isEnabled = false
       Outlet_Bet25.isEnabled = false
       Outlet_Bet10.isEnabled = false
       Outlet_Hit.isEnabled = false
       Outlet_Stand.isEnabled = false
       Outlet_Deal.isEnabled = false
       Outlet_Again.isEnabled = true
    }
    @IBAction func Hit(_ sender: Any) {
        
        //카드 정보 출력
        //플레이어는 카드의 숫자 합이 21이내에 받을 수 있습니다
        //Hit을 누르면 한번 더 숫자를 높인다
        nCardsPlayer += 1
        hitPlayer(n: nCardsPlayer)
        if (player.value() > 21)
        {
            checkWinner()
            Outlet_Bet50.isEnabled = false
            Outlet_Bet25.isEnabled = false
            Outlet_Bet10.isEnabled = false
            Outlet_Hit.isEnabled = false
            Outlet_Stand.isEnabled = false
            Outlet_Deal.isEnabled = false
            Outlet_Again.isEnabled = true
            
        }
    }
    @IBAction func Deal(_ sender: Any) {
        deal()
    }
    //MARK - 어게인 **
    func realAgain()
    {
       
           VplayerMoney  = 1000
            player.reset()
            dealer.reset()
    }

    @IBAction func ActionAgain(_ sender: Any) {
       
                deckIndex = 0
               deck.shuffle()
           
            
               VbetMoney  = 0
     
        for i in stride(from : 0 , to : LCardsDealer.count, by: 1)
        {
            LCardsDealer[i].removeFromSuperview()
        }
       for i in stride(from : 0 , to : LCardsPlayer.count, by: 1)
        {
            LCardsPlayer[i].removeFromSuperview()
        }
    
            LCardsPlayer.removeAll()
            LCardsDealer.removeAll()
                   
        
        //최종 메세지 출력
         playerMoney.text = "You have $\(VplayerMoney)";
         dealerPts.text = "Dealer: "
        playerPts.text = "Player: "
          status.text = "Place Your Bet!..."
             Outlet_Bet50.isEnabled = true
             Outlet_Bet25.isEnabled = true
             Outlet_Bet10.isEnabled = true
             Outlet_Hit.isEnabled = false
             Outlet_Stand.isEnabled = false
             Outlet_Deal.isEnabled = false
             Outlet_Again.isEnabled = false
          
       
    }
    
    func checkWinner() {
        LCardsDealer[0].removeFromSuperview()
        let newImageView = UIImageView(image: UIImage(named: dealer.cards[0].filename())!)
        newImageView.center = CGPoint(x: 300, y: 250)
        
        self.view.insertSubview(newImageView, belowSubview: LCardsDealer[1])
        LCardsDealer[0] = newImageView
        
        dealerPts.text = "Dealer: " + String(dealer.value())
        
        if (player.value() > 21)
        {
            //lose
            status.text = "Player Busts"
            audioController.playerEffect(name: SoundLose)
        }
        else if (dealer.value() > 21)
        {
            //win
            status.text = "Dealer Busts"
            VplayerMoney += VbetMoney * 2
            audioController.playerEffect(name: SoundWin)
        }
        else if (dealer.value() == player.value())
        {
            status.text = "Push"
            VplayerMoney += VbetMoney
        }
        else if (dealer.value() < player.value())
        {
            //win
            status.text = "You Won!"
            VplayerMoney += VbetMoney * 2
            audioController.playerEffect(name: SoundWin)
        }
        else
        {
            //lose
            status.text = "Sorry you lost!"
            audioController.playerEffect(name: SoundLose)
        }
        VbetMoney = 0
        playerMoney.text = "You Have $" + String(VplayerMoney)
        betMoney.text = "$" + String(VbetMoney)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Outlet_Hit.isEnabled = false
        Outlet_Stand.isEnabled = false
        Outlet_Deal.isEnabled = false
        Outlet_Again.isEnabled = false
        
        for i in 0...51 {
            deck.append(i)
        }
    }
    
    

}

