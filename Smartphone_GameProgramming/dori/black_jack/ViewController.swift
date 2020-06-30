
import UIKit

class ViewController: UIViewController {
    var player1 : Player = Player(name: "player1")
    var player2 : Player = Player(name: "player2")
    var player3 : Player = Player(name: "player3")
    
    var dealer : Player = Player(name: "dealer")
    
    var LCardsPlayer1 = [UIImageView]()
    var LCardsPlayer2 = [UIImageView]()
    var LCardsPlayer3 = [UIImageView]()
    var LCardsDealer = [UIImageView]()
    
    var deck = [Int]()
    var deckIndex = 0
    
    var betMoney1 : Int = 0
    var betMoney2 : Int = 0
    var betMoney3 : Int = 0
    var playerMoney : Int = 1000
    var nCards : Int = 0
    
    var Hwatoo1 = [UILabel]()
    var Hwatoo2 = [UILabel]()
    var Hwatoo3 = [UILabel]()
    var Hwatoo4 = [UILabel]()
    
    var deal_count : Int = 0 //카드를 추가할 때 deal의 수에 따라 index를 다르게 줌
    var madeName : String = "노메이드"
    var winner1 = [UILabel]()
    
    @IBOutlet weak var H10: UILabel!
    @IBOutlet weak var H11: UILabel!
    @IBOutlet weak var H12: UILabel!
    @IBOutlet weak var H13: UILabel!
    @IBOutlet weak var H14: UILabel!
    
    @IBOutlet weak var H20: UILabel!
    @IBOutlet weak var H21: UILabel!
    @IBOutlet weak var H22: UILabel!
    @IBOutlet weak var H23: UILabel!
    @IBOutlet weak var H24: UILabel!
    
    @IBOutlet weak var H30: UILabel!
    @IBOutlet weak var H31: UILabel!
    @IBOutlet weak var H32: UILabel!
    @IBOutlet weak var H33: UILabel!
    @IBOutlet weak var H34: UILabel!
    
    @IBOutlet weak var H40: UILabel!
    @IBOutlet weak var H41: UILabel!
    @IBOutlet weak var H42: UILabel!
    @IBOutlet weak var H43: UILabel!
    @IBOutlet weak var H44: UILabel!
    
    @IBOutlet weak var Outlet_PlayerPts1: UILabel!
    @IBOutlet weak var Outlet_PlayerPts2: UILabel!
    @IBOutlet weak var Outlet_PlayerPts3: UILabel!
    @IBOutlet weak var Outlet_DealerPts: UILabel!
    
    @IBOutlet weak var Oulet_betMoney1: UILabel!
    @IBOutlet weak var Outlet_betMoney2: UILabel!
    @IBOutlet weak var Outlet_betMoney3: UILabel!
    
    @IBOutlet weak var Outlet_PlayerMoney: UILabel!
    @IBOutlet weak var Outlet_Bet15: UIButton!
    @IBOutlet weak var Outlet_Bet11: UIButton!
    @IBOutlet weak var Outlet_Bet25: UIButton!
    @IBOutlet weak var Outlet_Bet21: UIButton!
    @IBOutlet weak var Outlet_Bet35: UIButton!
    @IBOutlet weak var Outlet_Bet31: UIButton!
    
    @IBOutlet weak var Outlet_status1: UILabel!
    @IBOutlet weak var Outlet_status2: UILabel!
    @IBOutlet weak var Outlet_status3: UILabel!
    @IBOutlet weak var Outlet_status4: UILabel!
    
    @IBOutlet weak var Outlet_Deal: UIButton!
    @IBOutlet weak var Outlet_Again: UIButton!
    
    @IBOutlet weak var Outlet_Dealer_win: UILabel!
    @IBOutlet weak var Outlet_Player1_win: UILabel!
    @IBOutlet weak var Outlet_Player2_win: UILabel!
    @IBOutlet weak var Outlet_player3_win: UILabel!
    // MARK: betting func
    @IBAction func Bet15(_ sender: Any) {
        betMoney1 += 50;
        if (betMoney1 <= playerMoney)
        {
            Oulet_betMoney1.text = "\(betMoney1)만"
            playerMoney -= 50;
            Outlet_PlayerMoney.text = "\(playerMoney)만"
            Outlet_Deal.isEnabled = true;
            audioController.playerEffect(name: SoundChip)
        }
        else
        {
            betMoney1 -= 50;
        }
    }
    @IBAction func Bet11(_ sender: Any) {
        betMoney1 += 10;
        if (betMoney1 <= playerMoney)
        {
            Oulet_betMoney1.text = "\(betMoney1)만"
            playerMoney -= 10;
            Outlet_PlayerMoney.text = "\(playerMoney)만"
            Outlet_Deal.isEnabled = true;
            audioController.playerEffect(name: SoundChip)
        }
        else
        {
            betMoney1 -= 10;
        }
    }
    
    @IBAction func Bet25(_ sender: Any) {
        betMoney2 += 50;
        if (betMoney2 <= playerMoney)
        {
            Outlet_betMoney2.text = "\(betMoney2)만"
            playerMoney -= 50;
            Outlet_PlayerMoney.text = "\(playerMoney)만"
            Outlet_Deal.isEnabled = true;
            audioController.playerEffect(name: SoundChip)
        }
        else
        {
            betMoney2 -= 50;
        }
    }
    @IBAction func Bet21(_ sender: Any) {
        betMoney2 += 10;
        if (betMoney2 <= playerMoney)
        {
            Outlet_betMoney2.text = "\(betMoney2)만"
            playerMoney -= 10;
            Outlet_PlayerMoney.text = "\(playerMoney)만"
            Outlet_Deal.isEnabled = true;
            audioController.playerEffect(name: SoundChip)
        }
        else
        {
            betMoney2 -= 10;
        }
    }
    @IBAction func Bet35(_ sender: Any) {
        betMoney3 += 50;
        if (betMoney3 <= playerMoney)
        {
            Outlet_betMoney3.text = "\(betMoney3)만"
            playerMoney -= 50;
            Outlet_PlayerMoney.text = "\(playerMoney)만"
            Outlet_Deal.isEnabled = true;
            audioController.playerEffect(name: SoundChip)
        }
        else
        {
            betMoney3 -= 50;
        }
    }
    @IBAction func Bet31(_ sender: Any) {
        betMoney3 += 10;
        if (betMoney3 <= playerMoney)
        {
            Outlet_betMoney3.text = "\(betMoney3)만"
            playerMoney -= 10;
            Outlet_PlayerMoney.text = "\(playerMoney)만"
            Outlet_Deal.isEnabled = true;
            audioController.playerEffect(name: SoundChip)
        }
        else
        {
            betMoney3 -= 10;
        }
    }
    // MARK: Hit Player func
    func hitPlayer1(n: Int) {
        let newCard = Card(temp: deck[deckIndex])
        deckIndex += 1
        
        player1.addCard(c: newCard)
        let newImageView = UIImageView ( image: UIImage(named: newCard.filename()))
        newImageView.center = CGPoint(x:1000, y: 1500)
        self.view.addSubview(newImageView)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       animations: {
                        newImageView.center = CGPoint(x:62 + n * 30 , y: 449)
                        newImageView.transform = CGAffineTransform(rotationAngle: -3.14)
        }, completion: nil)
        
        //H10 정상적으로 출력되는지 확인하기 -> 그다음 룰 짜면 될듯
        Hwatoo1[n].text = String(newCard.returnValue())
        
        LCardsPlayer1.append(newImageView)
        //Outlet_PlayerPts1.text = "P1" + String(player1.value())
        //audioController.playerEffect(name: SoundFlip)
    }
    
    func hitPlayer2(n: Int) {
        let newCard = Card(temp: deck[deckIndex])
        deckIndex += 1
        
        player2.addCard(c: newCard)
        let newImageView = UIImageView ( image: UIImage(named: newCard.filename()))
        newImageView.center = CGPoint(x:1000, y: 1500)
        self.view.addSubview(newImageView)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       animations: {
                        newImageView.center = CGPoint(x:342 + n * 30 , y: 449)
                        newImageView.transform = CGAffineTransform(rotationAngle: 3.14)
        }, completion: nil)
        //H20 정상적으로 출력되는지 확인하기 -> 그다음 룰 짜면 될듯
        Hwatoo2[n].text = String(newCard.returnValue())
        
        LCardsPlayer2.append(newImageView)
        //Outlet_PlayerPts2.text = "P1" + String(player2.value())
        //audioController.playerEffect(name: SoundFlip)
    }
    func hitPlayer3(n: Int) {
        let newCard = Card(temp: deck[deckIndex])
        deckIndex += 1
        
        player3.addCard(c: newCard)
        let newImageView = UIImageView ( image: UIImage(named: newCard.filename()))
        newImageView.center = CGPoint(x:1000, y: 1500)
        self.view.addSubview(newImageView)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       animations: {
                        newImageView.center = CGPoint(x:624 + n * 30 , y: 449)
                        newImageView.transform = CGAffineTransform(rotationAngle: 3.14)
        }, completion: nil)
        
        //H30 정상적으로 출력되는지 확인하기 -> 그다음 룰 짜면 될듯
        Hwatoo3[n].text = String(newCard.returnValue())
        
        LCardsPlayer3.append(newImageView)
        //Outlet_PlayerPts3.text = "P1" + String(player3.value())
        //audioController.playerEffect(name: SoundFlip)
    }
    // MARK: Hit Dealer func
    func hitDealer(n: Int) {
        
        
        let newCard = Card(temp: deck[deckIndex])
        deckIndex += 1
        dealer.addCard(c: newCard)
        //backcard - 뒤집은 상태의 카드 출력
        //filename - 오픈된 상태의 카드 출력
        let newImageView = UIImageView ( image: UIImage(named: newCard.filename()))
        newImageView.center = CGPoint(x: 0, y: 0)
        
        self.view.addSubview(newImageView)
        
        UIView.animate(withDuration: 1,
                       delay: 0.0,
                       animations: {
                        newImageView.center = CGPoint(x:300 + n * 30 , y: 150)
                        newImageView.transform = CGAffineTransform(rotationAngle: 3.14)
        }, completion: nil)
        
        //H30 정상적으로 출력되는지 확인하기 -> 그다음 룰 짜면 될듯
        Hwatoo4[n].text = String(newCard.returnValue())
        LCardsDealer.append(newImageView)
        //  dealerPts.text = "dealer " + String(dealer.value())
        //audioController.playerEffect(name: SoundFlip)
        
        //딜러 카드 뒤집기 만들어오기!
    }
    
    var pass_pos : [Int] = [-1,-1,-1]
    // MARK: made cheacker func
    func madeCheck(a1 : Int , a2 : Int, a3 : Int, a4 : Int, a5 : Int) -> String {
        //1단
        var t_check : [Int] = [a1, a2, a3, a4, a5]
        var not_check : [Int] = [a1, a2, a3, a4, a5]//not sorting
        
        //시작전에 초기화 한번 - !
        madeName = "노메이드"
        
        //원활한 검사를 위한 sorting
        
        for t in 0..<4 {
            var temp : Int = 0
            for i in stride(from: 0, to: 4, by: 1)
            {
                
                if t_check[i] > t_check[i + 1]
                {
                    temp = t_check[i]
                    t_check[i] = t_check[i + 1]
                    t_check[i + 1] = temp
                }
            }
            
        }//sorting END
        
        
        //비효율적인 노가다 코드
        for i in 0..<5 {
            for j in i+1..<5 {
                for k in j+1..<5 {
                    //1단
                    if(t_check[i] == 1)
                    {
                        
                        if(t_check[j] == 1 && t_check[k] == 8) //콩콩팔
                        { madeName = "콩콩팔";
                            var tmp : Int = 0
                            var b_ok : Bool = false
                            for t in 0..<5{
                                if not_check[t] == 1 && !b_ok
                                { pass_pos[0] = tmp; b_ok = true }
                                if not_check[t] == 1 && b_ok
                                { pass_pos[1] = tmp }
                                if not_check[t] == 1
                                { pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                        if(t_check[j] == 2 && t_check[k] == 7) //삐리칠
                        { madeName = "삐리칠";
                            var tmp : Int = 0
                            for t in 0..<5{
                                if not_check[t] == 1
                                {   pass_pos[0] = tmp}
                                if not_check[t] == 2
                                {pass_pos[1] = tmp}
                                if not_check[t] == 7
                                {pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                        if(t_check[j] == 3 && t_check[k] == 6) //물삼육
                        { madeName = "물삼육" ; var tmp : Int = 0
                            for t in 0..<5{
                                if not_check[t] == 1
                                {   pass_pos[0] = tmp}
                                if not_check[t] == 3
                                {pass_pos[1] = tmp}
                                if not_check[t] == 6
                                {pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                        if(t_check[j] == 4 && t_check[k] == 5) //빽사오
                        {madeName = "빽사오"; var tmp : Int = 0
                            for t in 0..<5{
                                if not_check[t] == 1
                                {   pass_pos[0] = tmp}
                                if not_check[t] == 4
                                {pass_pos[1] = tmp}
                                if not_check[t] == 5
                                {pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                        if(t_check[j] == 9 && t_check[k] == 10) //삥구장
                        { madeName = "삥구장";  var tmp : Int = 0
                            for t in 0..<5{
                                if not_check[t] == 1
                                {   pass_pos[0] = tmp}
                                if not_check[t] == 9
                                {pass_pos[1] = tmp}
                                if not_check[t] == 10
                                {pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                    }
                        //2단
                    else if(t_check[i] == 2)
                    {
                        if(t_check[j] == 2 && t_check[k] == 6) //니니육
                        { madeName = "니니육";   var tmp : Int = 0
                            var b_ok : Bool = false
                            for t in 0..<5{
                                if not_check[t] == 2 && !b_ok
                                { pass_pos[0] = tmp; b_ok = true }
                                if not_check[t] == 2 && b_ok
                                { pass_pos[1] = tmp }
                                if not_check[t] == 6
                                { pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                        if(t_check[j] == 3 && t_check[k] == 5) //이삼오
                        { madeName = "이삼오";  var tmp : Int = 0
                            for t in 0..<5{
                                if not_check[t] == 2
                                {   pass_pos[0] = tmp}
                                if not_check[t] == 3
                                {pass_pos[1] = tmp}
                                if not_check[t] == 5
                                {pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                        if(t_check[j] == 8 && t_check[k] == 10) //이판장
                        { madeName = "이판장";  var tmp : Int = 0
                            for t in 0..<5{
                                if not_check[t] == 2
                                {   pass_pos[0] = tmp}
                                if not_check[t] == 8
                                {pass_pos[1] = tmp}
                                if not_check[t] == 10
                                {pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                        //9단
                        if(t_check[j] == 9 && t_check[k] == 9) //구구리
                        { madeName = "구구리";   var tmp : Int = 0
                            var b_ok : Bool = false
                            for t in 0..<5{
                                if not_check[t] == 9 && !b_ok
                                { pass_pos[0] = tmp; b_ok = true }
                                if not_check[t] == 9 && b_ok
                                { pass_pos[1] = tmp }
                                if not_check[t] == 2
                                { pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                    }
                        //3단
                    else if(t_check[i] == 3)
                    {    pass_pos[0] = i;
                        if(t_check[j] == 3 && t_check[k] == 4) //심싱새
                        { madeName = "심싱새"; var tmp : Int = 0
                            var b_ok : Bool = false
                            for t in 0..<5{
                                if not_check[t] == 3 && !b_ok
                                { pass_pos[0] = tmp; b_ok = true }
                                if not_check[t] == 3 && b_ok
                                { pass_pos[1] = tmp }
                                if not_check[t] == 4
                                { pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                        if(t_check[j] == 7 && t_check[k] == 10) //삼칠장
                        { madeName = "삼칠장";  var tmp : Int = 0
                            for t in 0..<5{
                                if not_check[t] == 3
                                {   pass_pos[0] = tmp}
                                if not_check[t] == 7
                                {pass_pos[1] = tmp}
                                if not_check[t] == 10
                                {pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                        if(t_check[j] == 8 && t_check[k] == 9) //삼팔구
                        { madeName = "삼팔구";  var tmp : Int = 0
                            for t in 0..<5{
                                if not_check[t] == 3
                                {   pass_pos[0] = tmp}
                                if not_check[t] == 8
                                {pass_pos[1] = tmp}
                                if not_check[t] == 9
                                {pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                    }
                        //4단
                    else if(t_check[i] == 4)
                    {    pass_pos[0] = i;
                        if(t_check[j] == 6 && t_check[k] == 10) //사륙장
                        { madeName = "사륙장";  var tmp : Int = 0
                            for t in 0..<5{
                                if not_check[t] == 4
                                {   pass_pos[0] = tmp}
                                if not_check[t] == 6
                                {pass_pos[1] = tmp}
                                if not_check[t] == 10
                                {pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                        if(t_check[j] == 7 && t_check[k] == 9) //사칠구
                        { madeName = "사칠구"; var tmp : Int = 0
                            for t in 0..<5{
                                if not_check[t] == 4
                                {   pass_pos[0] = tmp}
                                if not_check[t] == 7
                                {pass_pos[1] = tmp}
                                if not_check[t] == 9
                                {pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                        //8단
                        if(t_check[j] == 8 && t_check[k] == 8) //팍팍사
                        { madeName = "팍팍사";var tmp : Int = 0
                            var b_ok : Bool = false
                            for t in 0..<5{
                                if not_check[t] == 8 && !b_ok
                                { pass_pos[0] = tmp; b_ok = true }
                                if not_check[t] == 8 && b_ok
                                { pass_pos[1] = tmp }
                                if not_check[t] == 4
                                { pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                    }
                        //5단
                    else if(t_check[i] == 5)
                    {
                        pass_pos[0] = i;
                        if(t_check[j] == 5 && t_check[k] == 10) //꼬꼬장
                        { madeName = "꼬꼬장"; var tmp : Int = 0
                            var b_ok : Bool = false
                            for t in 0..<5{
                                if not_check[t] == 5 && !b_ok
                                { pass_pos[0] = tmp; b_ok = true }
                                if not_check[t] == 5 && b_ok
                                { pass_pos[1] = tmp }
                                if not_check[t] == 10
                                { pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                        if(t_check[j] == 6 && t_check[k] == 9) //오륙주
                        { madeName = "오륙주";  var tmp : Int = 0
                            for t in 0..<5{
                                if not_check[t] == 5
                                {   pass_pos[0] = tmp}
                                if not_check[t] == 6
                                {pass_pos[1] = tmp}
                                if not_check[t] == 9
                                {pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                        if(t_check[j] == 7 && t_check[k] == 8) //오리발
                        { madeName = "오리발";  var tmp : Int = 0
                            for t in 0..<5{
                                if not_check[t] == 5
                                {   pass_pos[0] = tmp}
                                if not_check[t] == 7
                                {pass_pos[1] = tmp}
                                if not_check[t] == 8
                                {pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                    }
                        //6단
                    else if(t_check[i] == 6)
                    {
                        pass_pos[0] = i;
                        if(t_check[j] == 6 && t_check[k] == 8) //쪽쪽팔
                        { madeName = "쪽쪽팔"; var tmp : Int = 0
                            var b_ok : Bool = false
                            for t in 0..<5{
                                if not_check[t] == 6 && !b_ok
                                { pass_pos[0] = tmp; b_ok = true }
                                if not_check[t] == 6 && b_ok
                                { pass_pos[1] = tmp }
                                if not_check[t] == 8
                                { pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                        //7단
                        if(t_check[j] == 7 && t_check[k] == 7) //철철육
                        { madeName = "철철육";  var tmp : Int = 0
                            var b_ok : Bool = false
                            for t in 0..<5{
                                if not_check[t] == 7 && !b_ok
                                { pass_pos[0] = tmp; b_ok = true }
                                if not_check[t] == 7 && b_ok
                                { pass_pos[1] = tmp }
                                if not_check[t] == 6
                                { pass_pos[2] = tmp}
                                tmp += 1 }; return madeName
                        }
                    }
                    
                    
                }
            }
        }
        
        
        
        return madeName
    }
    
    // MARK: checkWinner func
    func checkWinner() {
        for i in stride(from: 0, to: 5, by: 1)
        {
            
            //기존에 있던 카드 이미지를 전부 지운다.
            LCardsDealer[i].removeFromSuperview()
            
            //dealer의 카드의 정보를 불러와서 집어넣는다.
            let newImageView = UIImageView(image: UIImage(named: dealer.cards[i].filename())!)
            newImageView.center = CGPoint(x:300 + i * 30 , y: 150)
            //새로 만든 이미지를 집어 넣는다.
            self.view.insertSubview(newImageView, belowSubview: LCardsDealer[i])
            LCardsDealer[i] = newImageView
            
        }
        
        //step 2 - 도리고짓땡 카드 네임 불러와서 변환
        var temp1 : [Int] = [0,0,0,0,0]
        var temp2 : [Int] = [0,0,0,0,0]
        var temp3 : [Int] = [0,0,0,0,0]
        var temp4 : [Int] = [0,0,0,0,0]
        for i in stride(from: 0, to: 5, by: 1)
        {
            
            //temp1[i] = player1.cards[i].returnSuit()
            temp1[i] = player1.cards[i].returnValue()
            
            //temp2[i] = player2.cards[i].returnSuit()
            temp2[i] = player2.cards[i].returnValue()
            
            //temp3[i] = player3.cards[i].returnSuit()
            temp3[i] = player3.cards[i].returnValue()
            temp4[i] = dealer.cards[i].returnValue()
        }
        //confirm
        //print("temp4 dealer2 - \(temp4)")
        
        //저장된걸 함수로 체크함
        Outlet_status1.text = madeCheck(a1: temp1[0], a2: temp1[1], a3: temp1[2], a4: temp1[3], a5: temp1[4])
        //카드 위치 옮기기
        if ((Outlet_status1.text != "노메이드") && ((pass_pos[0] != -1 ) && (pass_pos[1] != -1) && (pass_pos[2] != -1)))
        {
            player1.setMade(bool: true)
            LCardsPlayer1[pass_pos[0]].center = CGPoint(x:62 + pass_pos[0] * 30 , y: 449 + 50)
            LCardsPlayer1[pass_pos[1]].center = CGPoint(x:62 + pass_pos[1] * 30 , y: 449  + 50)
            LCardsPlayer1[pass_pos[2]].center = CGPoint(x:62 + pass_pos[2] * 30 , y: 449  + 50)
            //글자색
            Hwatoo1[pass_pos[0]].textColor = UIColor.orange
            Hwatoo1[pass_pos[1]].textColor = UIColor.orange
            Hwatoo1[pass_pos[2]].textColor = UIColor.orange
            var step1 : Int = 0
            var step2 : Int = 0
            var steps : [Int] = [0,0,0,0,0]
            steps[pass_pos[0]] = 1;steps[pass_pos[1]] = 1;steps[pass_pos[2]] = 1
            
            for i in 0..<5 {
                if(steps[i] != 1)
                {    step1 = i
                    steps[i] = 1
                    break;
                }
            }
            for i in 0..<5 {
                if(steps[i] == 0)
                { step2 = i;      }
            }
            
            
            Outlet_PlayerPts1.text =
                TtanK(
                    a1: ( player1.cards[step1].returnSuit() + player1.cards[step1].returnValue() * 10),
                    a2:  ( player1.cards[step2].returnSuit() + player1.cards[step2].returnValue() * 10), player: player1, stp1: step1, stp2: step2)
            
        }
        else {
            player1.setMade(bool: false)
            
        }
        //print("pass pos - \(pass_pos)") //comfirm
        pass_pos[0] = -1; pass_pos[1] = -1; pass_pos[2] = -1
        
        Outlet_status2.text = madeCheck(a1: temp2[0], a2: temp2[1], a3: temp2[2], a4: temp2[3], a5: temp2[4])
        //카드 위치 옮기기
        if ((Outlet_status2.text != "노메이드") && ((pass_pos[0] != -1 ) && (pass_pos[1] != -1) && (pass_pos[2] != -1)))
        {
            player2.setMade(bool: true)
            LCardsPlayer2[pass_pos[0]].center = CGPoint(x:342 + pass_pos[0] * 30 , y: 449 + 50)
            LCardsPlayer2[pass_pos[1]].center = CGPoint(x:342 + pass_pos[1] * 30 , y: 449  + 50)
            LCardsPlayer2[pass_pos[2]].center = CGPoint(x:342 + pass_pos[2] * 30 , y: 449  + 50)
            //글자색
            Hwatoo2[pass_pos[0]].textColor = UIColor.orange
            Hwatoo2[pass_pos[1]].textColor = UIColor.orange
            Hwatoo2[pass_pos[2]].textColor = UIColor.orange
            var step1 : Int = 0
            var step2 : Int = 0
            var steps : [Int] = [0,0,0,0,0]
            steps[pass_pos[0]] = 1;steps[pass_pos[1]] = 1;steps[pass_pos[2]] = 1
            for i in 0..<5 {
                if(steps[i] != 1)
                {    step1 = i
                    steps[i] = 1
                    break;
                }
            }
            for i in 0..<5 {
                if(steps[i] == 0)
                { step2 = i;      }
            }
            
            
            Outlet_PlayerPts2.text = TtanK(
                a1: ( player2.cards[step1].returnSuit() + player2.cards[step1].returnValue() * 10),
                a2:  ( player2.cards[step2].returnSuit() + player2.cards[step2].returnValue() * 10), player: player2, stp1: step1, stp2: step2)
        }
        // print("pass pos - \(pass_pos)") //comfirm
        pass_pos[0] = -1; pass_pos[1] = -1; pass_pos[2] = -1
        
        Outlet_status3.text = madeCheck(a1: temp3[0], a2: temp3[1], a3: temp3[2], a4: temp3[3], a5: temp3[4])
        //카드 위치 옮기기
        if ((Outlet_status3.text != "노메이드") && ((pass_pos[0] != -1 ) && (pass_pos[1] != -1) && (pass_pos[2] != -1)))
        {
            player3.setMade(bool: true)
            LCardsPlayer3[pass_pos[0]].center = CGPoint(x:624 + pass_pos[0] * 30 , y: 449 + 50)
            LCardsPlayer3[pass_pos[1]].center = CGPoint(x:624 + pass_pos[1] * 30 , y: 449  + 50)
            LCardsPlayer3[pass_pos[2]].center = CGPoint(x:624 + pass_pos[2] * 30 , y: 449  + 50)
            //글자색
            Hwatoo3[pass_pos[0]].textColor = UIColor.orange
            Hwatoo3[pass_pos[1]].textColor = UIColor.orange
            Hwatoo3[pass_pos[2]].textColor = UIColor.orange
            
            var step1 : Int = 0
            var step2 : Int = 0
            var steps : [Int] = [0,0,0,0,0]
            steps[pass_pos[0]] = 1;steps[pass_pos[1]] = 1;steps[pass_pos[2]] = 1
            
            for i in 0..<5 {
                if(steps[i] != 1)
                {    step1 = i
                    steps[i] = 1
                    break;
                }
            }
            for i in 0..<5 {
                if(steps[i] == 0)
                { step2 = i;      }
            }
            
            
            Outlet_PlayerPts3.text = TtanK(
                a1: ( player3.cards[step1].returnSuit() + player3.cards[step1].returnValue() * 10),
                a2:  ( player3.cards[step2].returnSuit() + player3.cards[step2].returnValue() * 10), player: player3, stp1: step1, stp2: step2)
        }
        //  print("pass pos - \(pass_pos)") //comfirm
        pass_pos[0] = -1; pass_pos[1] = -1; pass_pos[2] = -1
        
        Outlet_status4.text = madeCheck(a1: temp4[0], a2: temp4[1], a3: temp4[2], a4: temp4[3], a5: temp3[4])
        //카드 위치 옮기기
        if ((Outlet_status4.text != "노메이드") && ((pass_pos[0] != -1 ) && (pass_pos[1] != -1) && (pass_pos[2] != -1)))
        {
            dealer.setMade(bool: true)
            LCardsDealer[pass_pos[0]].center = CGPoint(x:300 + pass_pos[0] * 30 , y: 150 + 50)
            LCardsDealer[pass_pos[1]].center = CGPoint(x:300 + pass_pos[1] * 30 , y: 150 + 50)
            LCardsDealer[pass_pos[2]].center = CGPoint(x:300 + pass_pos[2] * 30 , y: 150 + 50)
            //글자색
            Hwatoo4[pass_pos[0]].textColor = UIColor.orange
            Hwatoo4[pass_pos[1]].textColor = UIColor.orange
            Hwatoo4[pass_pos[2]].textColor = UIColor.orange
            
            var step1 : Int = 0
            var step2 : Int = 0
            var steps : [Int] = [0,0,0,0,0]
            steps[pass_pos[0]] = 1;steps[pass_pos[1]] = 1;steps[pass_pos[2]] = 1
            
            for i in 0..<5 {
                if(steps[i] != 1)
                {    step1 = i
                    steps[i] = 1
                    break;
                }
            }
            for i in 0..<5 {
                if(steps[i] == 0)
                { step2 = i;      }
            }
            
            Outlet_DealerPts.text = TtanK(
                a1: ( dealer.cards[step1].returnSuit() + dealer.cards[step1].returnValue() * 10),
                a2:  ( dealer.cards[step2].returnSuit() + dealer.cards[step2].returnValue() * 10),  player: dealer, stp1: step1, stp2: step2)
            
        }
        //print("pass pos dealer 3 - \(pass_pos)") //comfirm
        pass_pos[0] = -1; pass_pos[1] = -1; pass_pos[2] = -1
        
    
        
        
        
        
    }
    //자투리 검사 족보
    func TtanK( a1 : Int , a2 : Int, player : Player, stp1 : Int , stp2 : Int) -> String {
        var nameNM : String = ""
        //자투리 검사 족보
        var ttt : Bool = false
        var temp : [Int] = [a1,a2]
        
        
        //원활한 검사를 위한 sorting
        
        var temp22 : Int = 0
        
        if temp[0] > temp[1]
        {
            temp22 = temp[0]
            temp[0] = temp[1]
            temp[1] = temp22
        }//sorting END
        
        var breakbool : Bool = false
        
        
        if(temp[0] == 31)
        {
            print("tt")
            if(temp[1] == 81) {nameNM = String("38광땡");
                print("tdt");
                player.setTotal(total: 23) //플레이어 점수 계산
                return nameNM;
            }
            
            
            if(temp[1] == 32) {nameNM =  "삼땡";
                player.setTotal(total: 13) //플레이어 점수 계산
                return nameNM;}
            
        }
        if(temp[0] == 11)
        {
            
            print("ttt")
            if(temp[1] == 81) {nameNM =  "광땡";
                player.setTotal(total: 21) //플레이어 점수 계산
                return nameNM;}
            if(temp[1] == 31) {nameNM =  "광떙";
                player.setTotal(total: 22) //플레이어 점수 계산
                return nameNM;}
            
            
            
            if(temp[1] == 12) {nameNM =  "삥떙";
                player.setTotal(total: 11) //플레이어 점수 계산
                return nameNM;}
            
        }
        if(temp[0] == 21)
        {
            
            if(temp[1] == 22) {nameNM =  "이땡";
                player.setTotal(total: 12) //플레이어 점수 계산
                return nameNM;}
            
        }
        if(temp[0] == 41)
        {
            
            if(temp[1] == 42) {nameNM =  "사땡";
                player.setTotal(total: 14) //플레이어 점수 계산
                return nameNM;}
            
        }
        if(temp[0] == 51)
        {
            
            if(temp[1] == 52) {nameNM =  "오땡";
                player.setTotal(total: 15) //플레이어 점수 계산
                return nameNM;}
            
        }
        if(temp[0] == 61)
        {
            
            if(temp[1] == 62) {nameNM = "육땡";
                player.setTotal(total: 16) //플레이어 점수 계산
                return nameNM;}
            
        }
        if(temp[0] == 71)
        {
            
            if(temp[1] == 72) {nameNM = "칠땡";
                player.setTotal(total: 17) //플레이어 점수 계산
                return nameNM;}
            
        }
        if(temp[0] == 81)
        {
            
            if(temp[1] == 82) {nameNM = "팔땡";
                player.setTotal(total: 18) //플레이어 점수 계산
                return nameNM;}
            
        }
        if(temp[0] == 91)
        {
            
            if(temp[1] == 92) {nameNM = "구땡";
                player.setTotal(total: 19) //플레이어 점수 계산
                return nameNM;}
            
        }
        if(temp[0] == 101)
        {
            
            if(temp[1] == 102) {nameNM = "장땡";
                player.setTotal(total: 20) //플레이어 점수 계산
                return nameNM;}
            
        }
        else{
            breakbool = true;
            player.setTotal(total: 1) //플레이어 점수 계산
        }
        
        //최종 점수계산 구현하기
        if (breakbool) //끗
        {
            let t : Int = ((player.cards[stp1].returnValue() + player.cards[stp2].returnValue()) % 10);
            print("break - \(player.cards[stp1].returnValue()) & break - \(player.cards[stp2].returnValue())")
            print("break - \(t)")
            switch t {
            case 0:
                player.setTotal(total: 2) //플레이어 점수 계산
                return "0끗"
            case 1:
                player.setTotal(total: 3) //플레이어 점수 계산
                return "한끗";
            case 2:
                player.setTotal(total: 4) //플레이어 점수 계산
                return "두끗";
            case 3:
                player.setTotal(total: 5) //플레이어 점수 계산
                return "세끗";
            case 4:
                player.setTotal(total: 6) //플레이어 점수 계산
                return "넷끗";
            case 5:
                player.setTotal(total: 7) //플레이어 점수 계산
                return "다섯끗";
            case 6:
                player.setTotal(total: 8) //플레이어 점수 계산
                return "여섯끗";
            case 7:
                player.setTotal(total: 9) //플레이어 점수 계산
                return "일곱끗";
            case 8:
                player.setTotal(total: 10) //플레이어 점수 계산
                return "여덟끗";
            default:
                player.setTotal(total: 0)
                return "-";
            }
        }
        player.setTotal(total: 1) //플레이어 점수 계산
        
        //끗이랑 망통 구현하기ㄴ
        return nameNM
    }
    
    // MARK: reset func
    func reset() {
        deck.shuffle()
        deckIndex = 0
        player1.reset()
        player2.reset()
        player3.reset()
        dealer.reset()
        player1.resetTotal()
        player2.resetTotal()
        player3.resetTotal()
        dealer.resetTotal()
        for i in stride(from: 0, to: 5, by: 1)
        {
            //기존에 있던 카드 이미지를 전부 지운다.
            LCardsDealer[i].removeFromSuperview()
            LCardsPlayer1[i].removeFromSuperview()
            LCardsPlayer2[i].removeFromSuperview()
            LCardsPlayer3[i].removeFromSuperview()
        }
        LCardsPlayer1.removeAll()
        LCardsPlayer2.removeAll()
        LCardsPlayer3.removeAll()
        LCardsDealer.removeAll()
        Outlet_status1.text = "Playing"
        Outlet_status2.text = "Playing"
        Outlet_status3.text = "Playing"
        Outlet_status4.text = "Playing"
        Hwatoo1.removeAll()
        Hwatoo2.removeAll()
        Hwatoo3.removeAll()
        Hwatoo4.removeAll()
        deckIndex = 0
        
        betMoney1 = 0 ; betMoney2 = 0; betMoney3 = 0
        //playerMoney = 1000
        nCards = 0
        deal_count = 0
        
        Outlet_Bet15.isEnabled = false
        Outlet_Bet11.isEnabled = false
        Outlet_Bet25.isEnabled = false
        Outlet_Bet21.isEnabled = false
        Outlet_Bet35.isEnabled = false
        Outlet_Bet31.isEnabled = false
        
        
        for i in 0...39 {
            deck.append(i)
        }
        deck.shuffle()
        Hwatoo1 = [H10, H11, H12, H13, H14]
        Hwatoo2 = [H20, H21, H22, H23, H24]
        Hwatoo3 = [H30, H31, H32, H33, H34]
        Hwatoo4 = [H40, H41, H42, H43, H44]
        
        for i in 0..<5 {
            Hwatoo1[i].text = ""
            Hwatoo2[i].text = ""
            Hwatoo3[i].text = ""
            Hwatoo4[i].text = ""
            
            Hwatoo1[i].textColor = UIColor.white
            Hwatoo2[i].textColor = UIColor.white
            Hwatoo3[i].textColor = UIColor.white
            Hwatoo4[i].textColor = UIColor.white
            
        }
        Outlet_DealerPts.text = ""
        
        for i in stride(from: 0, to: 4, by: 1) {
                   winner1[i].text = ""
             
               }
        
    }
    // MARK: whoWinner func
    func whoWinner() -> Int
    {
        var king : [Int] = [player1.getTotal(), player2.getTotal(), player3.getTotal(), dealer.getTotal()]; //각 플레이어들의 점수를 구한다.
        var step : Int = 0
        
        king.sort() // sorting
        step = king[3]
        king = [player1.getTotal(), player2.getTotal(), player3.getTotal(), dealer.getTotal()]; //각 플레이어들의 점수를 구한다.
        var te : Int = 0
        for i in 0..<4 {
            if(king[i] == step)
            {
                break
            }
            te += 1;
        }
        print("who \(king) - step \(te)");
        //0 - player1 / 1 - player2 / 2- player3 / 3 - dealer
     
        return te;
    }
    // MARK: Again func
    @IBAction func Again(_ sender: Any) {
        //코드 완성하기
        Outlet_Again.isEnabled = false
        Outlet_Deal.isEnabled = true
        
        reset()
        Outlet_PlayerMoney.text = String(playerMoney);
        Oulet_betMoney1.text = String(betMoney1);
        Outlet_betMoney2.text = String(betMoney2);
        Outlet_betMoney3.text = String(betMoney3);
        
    }
    // MARK: Deal func
    func deal() {
        //range 0~4
        
        hitPlayer1(n: deal_count)//p1 - 첫번째 카드
        hitPlayer2(n: deal_count)//p2 - 첫번째 카드
        hitPlayer3(n: deal_count)//p3 - 첫번째 카드
        
        hitDealer(n: deal_count)//dealer card - 1
        //hit dealer down  딜러 카드 이미지 뒤집기
        LCardsDealer[deal_count].image = UIImage(named:"cardback")
        deal_count += 1
        
        Outlet_Bet15.isEnabled = false
        Outlet_Bet11.isEnabled = false
        Outlet_Bet25.isEnabled = false
        Outlet_Bet21.isEnabled = false
        Outlet_Bet35.isEnabled = false
        Outlet_Bet31.isEnabled = false
    }

    @IBAction func Deal(_ sender: Any) {
        audioController.playerEffect(name: SoundFlip)
        //초반에는 1장의 카드만 나옴
        if deal_count == 0 {
            deal()
            for i in 0..<4 {
                Hwatoo4[i].isHidden = true
            }
            Outlet_PlayerPts1.text = ""
            Outlet_PlayerPts2.text = ""
            Outlet_PlayerPts3.text = ""
            Outlet_DealerPts.text = ""
            Outlet_Bet15.isEnabled = true
            Outlet_Bet11.isEnabled = true
            Outlet_Bet25.isEnabled = true
            Outlet_Bet21.isEnabled = true
            Outlet_Bet35.isEnabled = true
            Outlet_Bet31.isEnabled = true
            
        }
        else if 0 < deal_count && deal_count < 4 //1,2,3
        {
            deal()
            deal()
            deal()
            Outlet_PlayerPts1.text = ""
            Outlet_PlayerPts2.text = ""
            Outlet_PlayerPts3.text = ""
            Outlet_DealerPts.text = ""
            
            Outlet_Bet15.isEnabled = true
            Outlet_Bet11.isEnabled = true
            Outlet_Bet25.isEnabled = true
            Outlet_Bet21.isEnabled = true
            Outlet_Bet35.isEnabled = true
            Outlet_Bet31.isEnabled = true
        }
        else if deal_count == 4
        {
            deal()
        }
        if deal_count == 5
        {
            for i in 0..<4 {
                Hwatoo4[i].isHidden = false
            }
            
            //승패 검사해서 출력하기
            Outlet_Deal.isEnabled = false
            Outlet_Again.isEnabled = true
            checkWinner()
           
            var status = [UILabel]()
            status = [Outlet_status1, Outlet_status2, Outlet_status3, Outlet_status4];
            
            //0 - player1 / 1 - player2 / 2- player3 / 3 - dealer
            for i in stride(from: 0, to: 4, by: 1) {
                winner1[i].text = "패"
                if(i == whoWinner() && status[i].text != "노메이드")
                {
                    winner1[i].text = "승"
                }
            }
            
            //점수계산
            if (3 == whoWinner())
            {
                betMoney1 = 0
                betMoney2 = 0
                betMoney3 = 0
                print("\(betMoney1), \(betMoney2), \(betMoney3)")
                audioController.playerEffect(name: SoundLose)
            }
            else if(0 == whoWinner())
            {
                playerMoney += betMoney1 * 2
                
                  print("\(betMoney1), \(betMoney2), \(betMoney3)")
                    audioController.playerEffect(name: SoundWin)
            }
            else if(1 == whoWinner())
            {
                playerMoney += betMoney2 * 2
                  print("\(betMoney1), \(betMoney2), \(betMoney3)")
                    audioController.playerEffect(name: SoundWin)
            }
            else if(2 == whoWinner())
            {
                playerMoney += betMoney3 * 2
                  print("\(betMoney1), \(betMoney2), \(betMoney3)")
                    audioController.playerEffect(name: SoundWin)
            }
            //output
            Outlet_PlayerMoney.text = String(playerMoney);
                Oulet_betMoney1.text = String(betMoney1);
                Outlet_betMoney2.text = String(betMoney2);
                Outlet_betMoney3.text = String(betMoney3);
            
        }
    }
    
    
    var audioController : AudioController
    required init?(coder aDecoder: NSCoder) {
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames : AudioEffectFiles)
        
        super.init(coder: aDecoder)
    }
    
    // MARK: viewDidLoad func
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        Oulet_betMoney1.text = "원: \(betMoney1)"
        Outlet_betMoney2.text = "원: \(betMoney2)"
        Outlet_betMoney3.text = "원: \(betMoney3)"
        Outlet_PlayerMoney.text = "원: \(playerMoney)"
        
        Outlet_Bet15.isEnabled = false
        Outlet_Bet11.isEnabled = false
        Outlet_Bet25.isEnabled = false
        Outlet_Bet21.isEnabled = false
        Outlet_Bet35.isEnabled = false
        Outlet_Bet31.isEnabled = false
        
        Outlet_Again.isEnabled = false
        
        for i in 0...39 {
            deck.append(i)
        }
        Hwatoo1 = [H10, H11, H12, H13, H14]
        Hwatoo2 = [H20, H21, H22, H23, H24]
        Hwatoo3 = [H30, H31, H32, H33, H34]
        Hwatoo4 = [H40, H41, H42, H43, H44]
        
        winner1 = [Outlet_Player1_win, Outlet_Player2_win, Outlet_player3_win, Outlet_Dealer_win];
        for i in stride(from: 0, to: 4, by: 1) {
                          winner1[i].text = ""
                    
                      }
        
        deck.shuffle()
        deckIndex = 0
        
        for i in 0..<5 {
            Hwatoo1[i].text = ""
            Hwatoo2[i].text = ""
            Hwatoo3[i].text = ""
            Hwatoo4[i].text = ""
            
            Hwatoo1[i].textColor = UIColor.white
            Hwatoo2[i].textColor = UIColor.white
            Hwatoo3[i].textColor = UIColor.white
            Hwatoo4[i].textColor = UIColor.white
            
        }
        Outlet_status1.textColor = UIColor.orange
        Outlet_status2.textColor = UIColor.orange
        Outlet_status3.textColor = UIColor.orange
        self.view.backgroundColor = UIColor.darkGray
    }
}
