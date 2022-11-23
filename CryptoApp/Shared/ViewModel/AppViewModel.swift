//
//  AppViewModel.swift
//  CryptoApp (iOS)
//
//  Created by Tal Spektor on 03/09/2022.
//

import SwiftUI

class AppViewModel: ObservableObject {
    @Published var coins: [CryptoModel]?
    @Published var currentCoin: CryptoModel?
    
    init(){
        Task{
            do{
                try await fetchCryptoData()
            }catch{
                // HANDLE ERROR
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: Fetching Crypto Data
    func fetchCryptoData() async throws {
        
        guard let url = url else{ return }
        let session = URLSession.shared
        
        let response = try await session.data(from: url)
        let jsonData = try JSONDecoder().decode([CryptoModel].self, from: response.0)
        
        // Alternative For DispatchQueue Main
        await MainActor.run(body: {
            self.coins = jsonData
            if let firstCoin = jsonData.first{
                self.currentCoin = firstCoin
            }
        })
    }
}
