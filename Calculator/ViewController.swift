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
        var doubleResult = calculator.result
        var strResult = String(doubleResult)
        var arr = [String]()
        var arr2 = [String]()
        for c in strResult {
            arr.append(String(c))
        }
        var index = arr.firstIndex(of: ".")
        
        for i in index! ..< arr.count {
            arr2.append(arr[i])
        }
        
        if arr2.contains("1") || arr2.contains("2") || arr2.contains("3") || arr2.contains("4") || arr2.contains("5") || arr2.contains("6") || arr2.contains("7") || arr2.contains("8") || arr2.contains("9")  {
            display.text = String(calculator.result)
        } else {
            var intResult = Int(calculator.result)
            display.text = String(intResult)
        }
        
        
    }
}

