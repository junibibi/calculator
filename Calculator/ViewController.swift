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
        let result = setNumberType(number: doubleResult)
        display.text = result
    }
    
    
    
    @IBAction func touchMC() {
        calculator.memory = 0
        display.text = "0"
    }
    
    
    @IBAction func touchMR() {
        let memory = calculator.memory
//        let stringM = String(memory)
        
        let stringM = setNumberType(number: memory)
        display.text = stringM
        
    }
    
    @IBAction func touchMSubtract() {
        userTouchingDigit = false

        let string = display.text!
        let double = Double(string)!
        
        calculator.mSubtract(number: double)
    }
    
    @IBAction func touchMAdd() {
        userTouchingDigit = false
        
        let string = display.text!
        let double = Double(string)!
        
        calculator.mAdd(number: double)

    }
    
    //Double/Int 변환
    func setNumberType(number: Double) -> String {
        var doubleNumber = number
        var stringNumber = String(doubleNumber)
        
        var numbers = [String]()
        var numbersBelowDot = [String]()
        
        for c in stringNumber {
            numbers.append(String(c))
        }
        var index = numbers.firstIndex(of: ".")
        
        for i in index! ..< numbers.count {
            numbersBelowDot.append(numbers[i])
        }
        
        if numbersBelowDot.contains("1") || numbersBelowDot.contains("2") || numbersBelowDot.contains("3") || numbersBelowDot.contains("4") || numbersBelowDot.contains("5") || numbersBelowDot.contains("6") || numbersBelowDot.contains("7") || numbersBelowDot.contains("8") || numbersBelowDot.contains("9")  {
            return String(doubleNumber)
            
        } else {
            var intNumber = Int(doubleNumber)
             return String(intNumber)
        }
    }
    
}

