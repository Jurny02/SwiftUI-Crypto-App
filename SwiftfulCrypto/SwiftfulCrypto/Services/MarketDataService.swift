//
//  MarketDataService.swift
//  SwiftfulCrypto
//
//  Created by Bartosz Jurczyk on 19/09/2026.
//

import Foundation
import Combine

class MarketDataService {
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscription: AnyCancellable?

    init() {
        getData()
    }

    private func getData() {

        guard let url = URL(
            string: "https://api.coingecko.com/api/v3/global"
        ) else {
            return
        }

        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion) { [weak self] (returnedGlobalData) in
                let marketData = returnedGlobalData.data
                self?.marketData = marketData
                self?.marketDataSubscription?.cancel()
            }
    }

}
