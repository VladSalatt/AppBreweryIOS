//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by OUT-Koshelev-VO on 24.02.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var numberPeople: Int?
    var result: String?
    var precent: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = result
        settingsLabel.text = "Split between \(numberPeople!) people, with \(precent!)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
