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
        case changeSign((Double) -> Double)
        case percentage((Double) -> Double)
        case divide((Double, Double) -> Double)
        case multiply((Double, Double) -> Double)
        case subtraction((Double, Double) -> Double)
        case add((Double, Double) -> Double)
        case equals
    }
    
    var operationSign: [String: Operation] = [
        "AC": .removeAll,
        "±": .changeSign({-$0}),
        "%": .percentage({0.01*$0}),
        "÷": .divide({$0/$1}),
        "×": .multiply({$0*$1}),
        "-": .subtraction({$0-$1}),
        "+": .add({$0+$1}),
        "=": . equals
    ]
    
    func performOperation(sign: String) {
        if let operationSign = operationSign[sign] {
            switch operationSign {
            case .removeAll:
                accumulatedValue = 0.0
            case .changeSign(let changeSign):
                accumulatedValue = changeSign(accumulatedValue)
            case .percentage(let percentage):
                accumulatedValue = percentage(accumulatedValue)
            case .divide(let divide):
                pending = PendigValue.init(pendingOperation: divide, firstValue: accumulatedValue)
            case .multiply(let multiply):
                pending = PendigValue.init(pendingOperation: multiply, firstValue: accumulatedValue)
            case .subtraction(let subtraction):
                pending = PendigValue.init(pendingOperation: subtraction, firstValue: accumulatedValue)
            case .add(let add):
                pending = PendigValue.init(pendingOperation: add, firstValue: accumulatedValue)
            case .equals:
                if pending != nil {
                    accumulatedValue = pending!.pendingOperation(pending!.firstValue, accumulatedValue)
                }
            }
        }
    }
    //MARK: 연산을기다리는값 구조체
    struct PendigValue {
        var pendingOperation: (Double, Double) -> Double
        var firstValue: Double
    }
    // = 이 눌리고 나면 연산을기다리는 값은 nil로 하기위해 옵셔널로 선언함
    var pending: PendigValue?
    
    //result에는 연산하고 업데이트된 accumulatedValue가 들어간다.
    var result: Double {
        get {
            return accumulatedValue
        }
    }

}
