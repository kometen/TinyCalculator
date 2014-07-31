//
//  TinyCalculatorModel.swift
//  TinyCalculator
//
//  Created by Claus Guttesen on 22/07/14.
//  Copyright (c) 2014 Claus Guttesen. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class TinyCalculatorModel {
    let min: Int, max: Int
    var a: Int, b: Int, c: Int = 0
    var msg: String = ""
    var icon: UIImage = UIImage()
    let correctIcon: UIImage = UIImage(named: "1206574733930851359Ryan_Taylor_Green_Tick.svg.med")
    let incorrectIconRed: UIImage = UIImage(named: "1195436930767206781not_ok_mark_h_kon_l_vdal_01.svg.med")
    let incorrectIconOrange: UIImage = UIImage(named: "orange-cross-md")
    
    init(min: Int, max: Int) {
        self.min = min
        self.max = max
        a = Int(arc4random_uniform(UInt32(max))) + 1
        b = Int(arc4random_uniform(UInt32(max))) + 1
        if a < b { swap(&a, b: &b) }
    }
    
    func checkResult() {
        if (a + b) == c {
            msg = "Rigtig"
            icon = correctIcon
        } else {
            msg = "Prøv igen"
            icon = incorrectIconOrange
        }
    }
    
    func swap(inout a: Int, inout b: Int) {
        var tmp = a
        a = b
        b = tmp
    }

}
