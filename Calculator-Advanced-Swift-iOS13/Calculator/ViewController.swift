//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!

    private var isFinishTypingNumber: Bool = true
    private var calculator = CalculatorLogic()

    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishTypingNumber = true
        calculator.setNumber(displayValue)
        
        if let calculateMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calculateMethod) {
                displayValue = result
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishTypingNumber {
                displayLabel.text = numValue
                isFinishTypingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

}

