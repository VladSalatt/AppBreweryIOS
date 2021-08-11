//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError(_ error: Error)
    func didUpdateCurrency(_ manager: CoinManager, from model: CoinModel)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "951C4A68-18C9-486C-B71A-9E05429A6E2A"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    delegate?.didFailWithError(error!)
                    return
                }
                if let safeData = data {
                    if let coin = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCurrency(self, from: coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let coinName = decodedData.asset_id_quote
            let lastPrice = decodedData.rate
            
            let coin = CoinModel(name: coinName, price: lastPrice)
            return coin
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
        
}
