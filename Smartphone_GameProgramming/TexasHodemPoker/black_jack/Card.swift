//
//  Card.swift
//  black_jack
//
//  Created by KpuGame on 2020/06/08.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import Foundation

class Card {
    private var value : Int;
    private var x : Int;
    private var suit : String;
    
    init(temp: Int) {
        self.value = temp%13 + 1
        self.x = temp / 13
        self.suit = ""
    }
    
    func getValue() -> Int {
        if(self.value > 10)
        {
            return 10
        }
        else {
            return self.value
        }
    }
    func getsuit() -> String {
        if (x == 0)
        {
            self.suit = "Clubs";
        }
        else if (x == 1)
        {
            self.suit = "Spades";
        }
        else if (x == 2)
        {
            self.suit = "Hearts";
        }
        else
        {
            self.suit = "Diamonds";
        }
        return self.suit
    }
    //뒤집은 카드 코드
    func backcard() -> String {
        return "b2fv"
    }
    
    func filename() -> String {
        return getsuit() + String(self.value)
    }
}
