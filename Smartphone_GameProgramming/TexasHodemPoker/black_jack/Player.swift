//
//  Player.swift
//  black_jack
//
//  Created by KpuGame on 2020/06/08.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import Foundation
class Player {
    var cards = [Card]()
    private var N: Int = 0
    private var name : String
    init(name : String) {
        self.name = name
    }
    
    func inHand() -> Int {
        return self.N
    }
    
    func addCard(c: Card) {
        cards.append(c)
        self.N += 1
    }
    
    func reset() {
        self.N = 0
        cards.removeAll()
    }
    
    func value() -> Int { //카드 점수 계산 Ace는 1혹은 11으로 모두 사용할 수 있음
        //일단 11으로 계산한 후 21이 넘어가면 1로 다시 계산한다.
        //king Queen Jack은 각각 10으로 계산합니다
        var total: Int = 0
        var ace : Int = 0 //Ace카드 개수 변수
        // ace 카드가 없다면 + 11 중복해서 나왔다면 1로 계산한다
        
        
        //j 10 q 11 k 12
        for i in cards
        {
            //ace가 나왔다면
        if (i.getValue() == 1 && ace == 0)
        {
            total += 11
            ace += 1
        }
        else if (i.getValue() == 1 && ace > 0)
        {
            total += 1
        }
        else
        {
                  total += i.getValue()

        }
            
        }
        return total
    }
}
