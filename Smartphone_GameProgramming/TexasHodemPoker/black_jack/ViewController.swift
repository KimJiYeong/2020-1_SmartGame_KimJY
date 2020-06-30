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
    var community : Player = Player(name: "community")

    var LCardsPlayer = [UIImageView]()
    var LCardsDealer = [UIImageView]()
    var LCardsCommunity = [UIImageView]()
    
    var deck = [Int]()
    var deckIndex = 0
    
    var VbetMoney : Int = 0
    var VplayerMoney : Int = 1000
    var nState : Int = 0
    
    @IBOutlet weak var dealerPts: UILabel!
    @IBOutlet weak var playerPts: UILabel!
    @IBOutlet weak var betMoney: UILabel!
    @IBOutlet weak var playerMoney: UILabel!
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var Outlet_Check: UIButton!
    @IBOutlet weak var Outlet_BetX1: UIButton!
    @IBOutlet weak var Outlet_BetX2: UIButton!
    @IBOutlet weak var Outlet_Deal: UIButton!
    @IBOutlet weak var Outlet_Again: UIButton!
    
    
 
    var audioController : AudioController
    required init?(coder aDecoder: NSCoder) {
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames : AudioEffectFiles)
    
        super.init(coder: aDecoder)
    }
    
    @IBAction func Check(_ sender: Any) {
        
    }
    @IBAction func BetX1(_ sender: Any) { //1배 배팅 액션 메소드
        VbetMoney *= 2;
        if (VbetMoney <= VplayerMoney)
        {
            betMoney.text = "$\(VbetMoney)"
            VplayerMoney -= (VbetMoney)
            VplayerMoney -= (VbetMoney/2)
            playerMoney.text = "You have $\(VplayerMoney)"
            
            Outlet_Deal.isEnabled = true
            audioController.playerEffect(name: SoundChip)
        }
        else
        {
            VbetMoney /= 2;
        }
        
        if(nState == 4)
        {
            checkWinner()
            nState = 0;
            Outlet_Check.isEnabled = false
            Outlet_BetX1.isEnabled = false
            Outlet_BetX2.isEnabled = false
            
            Outlet_Deal.isEnabled = false
            Outlet_Again.isEnabled = true
        }
        else
        {
            Outlet_Check.isEnabled = false
            Outlet_BetX1.isEnabled = false
            Outlet_BetX2.isEnabled = false
            
            Outlet_Deal.isEnabled = true
            Outlet_Again.isEnabled = false
        }
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
        Outlet_Deal.isEnabled = false
        Outlet_Again.isEnabled = false
        
        for i in 0...51 {
            deck.append(i)
        }
    }
    
    

}

