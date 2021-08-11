//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by OUT-Koshelev-VO on 19.05.2021.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermedianCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let num = number {
            switch symbol {
            case "+/-":
                return num * -1
            case "%":
                return num * 0.01
            case "AC":
                return 0
            case "=":
                return performTwoNumberCalculation(n2: num)
            default:
                intermedianCalculation = (n1: num, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2 number: Double) -> Double? {
        if let n1 = intermedianCalculation?.n1,
           let operation = intermedianCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + number
            case "-":
                return n1 - number
            case "×":
                return n1 * number
            case "÷":
                return n1 / number
            default:
                fatalError("The operation is invalid÷")
            }
        }
        return nil
    }
}
