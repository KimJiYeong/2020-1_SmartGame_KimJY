//
//  Shuffle.swift
//  black_jack
//
//  Created by KpuGame on 2020/06/08.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//

import Foundation

extension Array {
    mutating func shuffle() {
        if count < 2 {return }
        for i in 0..<(count - 1)
        {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            if i != j
            {
                self.swapAt(i, j)
            }
        }
    }
}
