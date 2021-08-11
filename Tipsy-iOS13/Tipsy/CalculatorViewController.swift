//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipsyBrain = TipsyBrain()
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var result2DecimalPlaces = "0.0"

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        tipsyBrain.changeTip(precent: sender.currentTitle!)
    }
    @IBAction func steppedValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        tipsyBrain.setNumberOfPeople(number: sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        
        if bill != "" {
            let number = tipsyBrain.getNumberOfPeople()
            let tmpTip = tipsyBrain.getTip()
            tipsyBrain.calculateResult(bill: bill, number: number, tip: tmpTip)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.numberPeople = tipsyBrain.getNumberOfPeople()
            destinationVC.result = tipsyBrain.getResult()
            destinationVC.precent = tipsyBrain.getPrecent()
        }
    }
    
}

