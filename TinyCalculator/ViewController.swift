//
//  ViewController.swift
//  TinyCalculator
//
//  Created by Claus Guttesen on 22/07/14.
//  Copyright (c) 2014 Claus Guttesen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var a : UILabel!
    @IBOutlet var b : UILabel!
    @IBOutlet var c : UITextField!
    @IBOutlet var msg : UILabel!
    
    var tcalc = TinyCalculatorModel(min: 1, max: 9)

    @IBAction func enterNumber(sender : AnyObject) {
        tcalc.c = c.text.bridgeToObjectiveC().integerValue
        tcalc.checkResult()
        msg.text = tcalc.msg
//        println(tcalc.msg)
    }
    
    @IBAction func resetNumbers(sender : AnyObject) {
        var oldA = tcalc.a
        var oldB = tcalc.b
        do {
            tcalc = TinyCalculatorModel(min: 1, max: 9)
        } while ((oldA == tcalc.a || oldB == tcalc.b) && (tcalc.a != tcalc.b))
        msg.text = ""
        refreshUI()
    }

    func refreshUI() {
        if tcalc.a < tcalc.b { swap(&tcalc.a, b: &tcalc.b) }
        a.text = String(format: "%2i", tcalc.a);
        b.text = String(format: "%2i", tcalc.b);
        c.text = ""
    }
    
    func swap(inout a: Int, inout b: Int) {
        var tmp = a
        b = a
        a = tmp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        c.becomeFirstResponder()
        refreshUI();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

