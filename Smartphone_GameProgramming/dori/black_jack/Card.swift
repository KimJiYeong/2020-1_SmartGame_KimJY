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
    private var suit_Int : Int;
    
    init(temp: Int) {
        self.value = temp%12 + 1
        self.x = temp / 12
        self.suit = ""
        self.suit_Int = 0
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
            self.suit = "1";
            self.suit_Int = 1;
        }
        else if (x == 1)
        {
            self.suit = "2";
            self.suit_Int = 2;
        }
        else if (x == 2)
        {
            self.suit = "3";
            self.suit_Int = 3;
        }
        else
        {
            self.suit = "4";
            self.suit_Int = 4;
        }
        return self.suit
    }
    //뒤집은 카드 코드
    func backcard() -> String {
        return "cardback"
    }
    func cardNum() -> String{
        return self.suit
    }
    //도리고짓땡 판단을 위한 코드
    func returnSuit() -> Int {
        return self.suit_Int
        
    }
    func returnValue() -> Int {
        return self.value
    }
  
    func filename() -> String {
        return String(self.value) + "." + getsuit()
    }
}
