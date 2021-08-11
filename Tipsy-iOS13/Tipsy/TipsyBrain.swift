//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by OUT-Koshelev-VO on 24.02.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
    var tip: Double?
    var billTotal: Double?
    var numberOfPeople: Int?
    var result2Decimal: String?
    
    mutating func changeTip(precent: String) {
        let buttonTitleWithourChar = String(precent.dropLast())
        let buttonNumber = Double(buttonTitleWithourChar)!
        tip = buttonNumber / 100
    }
    
    func getTip() -> Double {
        return tip ?? 0.0
    }
    
    func getPrecent() -> Int {
        return Int(tip! * 100)
    }
    
    mutating func setNumberOfPeople(number: Double) {
        self.numberOfPeople = Int(number)
    }
    
    func getNumberOfPeople() -> Int {
        return numberOfPeople ?? 1
    }
    
    mutating func calculateResult(bill: String, number: Int, tip: Double) -> String? {
        billTotal = Double(bill) ?? 0.0
        let result = billTotal! * (1 + tip) / Double(number)
        result2Decimal = String(format: "%0.2f", result)
        return(result2Decimal)
    }
    
    func getResult() -> String {
        return result2Decimal ?? "0.0"
    }
}
