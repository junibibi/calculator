//
//  ViewController.swift
//  Calculator
//
//  Created by JH on 18/09/2019.
//  Copyright © 2019 JH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userTouchingDigit = false
    
    let calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func touchDigit(_ sender: UIButton) {
        if let digit = sender.currentTitle {
            if userTouchingDigit {
                var operand = display.text!
                operand = operand + digit
                display.text = operand
            } else {
               display.text = digit
            }
            userTouchingDigit = true
        }
    }
    
    @IBAction func touchOperationSign(_ sender: UIButton) {
        if userTouchingDigit {
            if let number = Double(display.text!) {
                calculator.setOperand(number: number)
            }
            userTouchingDigit = false
        }
        if let sign = sender.currentTitle {
            calculator.performOperation(sign: sign)
        }
        display.text = String(calculator.result)
    }
}

