//
//  CoinModel.swift
//  ByteCoin
//
//  Created by OUT-Koshelev-VO on 06.03.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let name: String
    let price: Double
    
    var priceString: String {
        return String(format: "%.0f", price)
    }
}
