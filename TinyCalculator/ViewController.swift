//
//  ViewController.swift
//  TinyCalculator
//
//  Created by Claus Guttesen on 22/07/14.
//  Copyright (c) 2014 Claus Guttesen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var a: UILabel!
    @IBOutlet var b: UILabel!
    @IBOutlet var c: UITextField!
    @IBOutlet var msg: UILabel!
    @IBOutlet var feedbackIcon: UIImageView!
    @IBOutlet var retryButton: UIButton!
    
    var tcalc = TinyCalculatorModel(min: 1, max: 9)

    @IBAction func enterNumber(sender : AnyObject) {
        tcalc.c = c.text.toInt()!
        tcalc.checkResult()
//        msg.text = tcalc.msg
        feedbackIcon.image = tcalc.icon
        retryButton.enabled = tcalc.enableRetryButton
    }
    
    @IBAction func resetNumbers(sender : AnyObject) {
        var oldA = tcalc.a
        var oldB = tcalc.b
        do {
            tcalc = TinyCalculatorModel(min: 1, max: 9)
        } while (oldA == tcalc.a || oldB == tcalc.b)
        refreshUI()
    }

    func refreshUI() {
        a.text = String(format: "%2i", tcalc.a);
        b.text = String(format: "%2i", tcalc.b);
        c.text = ""
        msg.text = ""
        feedbackIcon.image = nil
        retryButton.enabled = tcalc.enableRetryButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        c.becomeFirstResponder()
        retryButton.setImage(UIImage(named: "Solid_white"), forState: UIControlState.Disabled)
        retryButton.setImage(UIImage(named: "daily-md"), forState: UIControlState.Normal)
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

