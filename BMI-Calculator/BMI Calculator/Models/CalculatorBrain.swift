//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by OUT-Koshelev-VO on 24.02.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    mutating func calculateBMI(_ weight: Float,_ height: Float) {
        let bmiValue = weight / powf(height, 2)
        setState(for: bmiValue)
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    private mutating func setState(for bmiValue: Float) {
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eats more pies", color: UIColor.blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "All right", color: UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eats less foods", color: UIColor.red)
        }
    }
}
