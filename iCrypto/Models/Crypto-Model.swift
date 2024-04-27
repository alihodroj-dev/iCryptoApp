//
//  Crypto-Model.swift
//  iCrypto
//
//  Created by Ali Hodroj on 11/04/2023.
//

import Foundation

struct Crypto: Decodable {
    let asset_id_base: String
    let rates: [Rate]
}

struct Rate: Decodable, Identifiable, Equatable {
    let id = UUID()
    let time: String
    let asset_id_quote: String
    let rate: Double
    
    static var sampleRates: [Rate] {
        var tempRates = [Rate]()
        for num in 0...5 {
            let randomCurrencies = ["BTC", "ETH", "XRP"]
            tempRates.append(Rate(time: "82234194", asset_id_quote: randomCurrencies.randomElement()!, rate: Double(num)))
        }
        return tempRates
    }
}
