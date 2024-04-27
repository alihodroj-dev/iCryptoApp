//
//  CryptoAPI.swift
//  iCrypto
//
//  Created by Ali Hodroj on 11/04/2023.
//

import Foundation

class CryptoAPI {
    let API_KEY: String = "0B5971E9-7747-4298-926E-2A72836881D1"
    
    func getData(previewwMode: Bool, _ completion:@escaping ([Rate]) -> Void ) {
        
        if previewwMode {
            completion(Rate.sampleRates)
            return
        }
        
        guard let url = URL(string: "https://rest.coinapi.io/v1/exchangerate/USD?invert=false&apikey=\(API_KEY)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, res, err in
            
            guard let data = data else {
                print("couldnt retrieve data, returning sampple rates")
                completion(Rate.sampleRates)
                return
            }
            
            do {
                let retrievedData = try JSONDecoder().decode(Crypto.self, from: data)
                completion(retrievedData.rates)
                print(retrievedData.rates.count)
            } catch {
                print(err?.localizedDescription ?? "error")
                completion(Rate.sampleRates)
            }
        }.resume()
    }
}
