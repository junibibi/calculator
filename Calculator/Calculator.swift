//
//  Calculator.swift
//  Calculator
//
//  Created by JH on 18/09/2019.
//  Copyright © 2019 JH. All rights reserved.
//

import Foundation

class Calculator {
    
    //누적값
    var accumulatedValue = 0.0
    
    //피연산자값을 셋팅함(누적값에 전달받은숫자를 넣어준다)
    func setOperand(number: Double) {
        accumulatedValue = number
    }
    
    enum Operation {
        case removeAll
        case changeSign
        case percentage
        case devide
        case multiply
        case subtraction
        case add
        case equals
    }
}
