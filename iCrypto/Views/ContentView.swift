//
//  ContentView.swift
//  iCrypto
//
//  Created by Ali Hodroj on 11/04/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var vm = ViewModel()
    @State var amount: String = "1"
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                List(vm.filteredData) { rate in
                    HStack {
                        Text(rate.asset_id_quote)
                            .bold()
                        Spacer()
                        Text("\((Double(rate.rate) * (Double(amount) ?? 1)), specifier: "%.2f")")
                    }
                }.onAppear {
                    vm.updateData()
                }
                .listStyle(.plain)
                .searchable(text: $vm.searchText)
                .navigationTitle("iCrypto")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
