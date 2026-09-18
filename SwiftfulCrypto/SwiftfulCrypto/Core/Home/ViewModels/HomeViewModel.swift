//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Bartosz Jurczyk on 11/09/2026.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {

    @Published var statistics: [StatisticModel] = [
        .init(title: "Title", value: "Value", percentageChange: 1),
        .init(title: "Title", value: "Value"),
        .init(title: "Title", value: "Value"),
        .init(title: "Title", value: "Value", percentageChange: -2),
    ]
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText = ""

    private let dataService = CoinDataService()
    private var cancellables: Set<AnyCancellable> = []

    init() {
        addSubscribers()
    }

    func addSubscribers() {
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self ] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }

    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }

        let lowercasedText = text.lowercased()
        return coins.filter { (coin) -> Bool in
            coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
}
