//
//  TinyCalculatorModel.swift
//  TinyCalculator
//
//  Created by Claus Guttesen on 22/07/14.
//  Copyright (c) 2014 Claus Guttesen. All rights reserved.
//

import Foundation
import Foundation

class TinyCalculatorModel {
    let min: Int, max: Int
    var a: Int, b: Int, c: Int = 0
    var msg: String = ""
    
    init(min: Int, max: Int) {
        self.min = min
        self.max = max
        a = Int(arc4random_uniform(UInt32(max))) + 1
        b = Int(arc4random_uniform(UInt32(max))) + 1
    }
    
    func checkResult() {
        if (a + b) == c {
            msg = "Rigtig"
        } else {
            msg = "Prøv igen"
        }
    }
}
