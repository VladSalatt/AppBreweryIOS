//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by OUT-Koshelev-VO on 22.02.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var advieceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmiValue
        view.backgroundColor = color
        advieceLabel.text = advice
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
