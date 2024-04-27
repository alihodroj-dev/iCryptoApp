//
//  ContentView-ViewModel.swift
//  iCrypto
//
//  Created by Ali Hodroj on 11/04/2023.
//

import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        @Published private(set) var rates: [Rate] = [Rate]()
        @Published var searchText = ""
        
        var filteredData: [Rate] {
            return searchText == "" ? rates : rates.filter({ rate in
                rate.asset_id_quote.contains(searchText.uppercased())
            })
        }
        
        func updateData() {
            CryptoAPI().getData(previewwMode: false) { rates in
                DispatchQueue.main.async {
                    withAnimation {
                        self.rates = rates
                    }
                }
            }
        }
    }
}
