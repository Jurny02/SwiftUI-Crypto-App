//
//  CoinImageViewModel.swift
//  SwiftfulCrypto
//
//  Created by Bartosz Jurczyk on 15/09/2026.
//


import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false

    private let coin: CoinModel
    private let coinDataService: CoinImageService
    private var camcellables = Set<AnyCancellable>()

    init(coin: CoinModel) {
        self.coin = coin
        self.coinDataService = CoinImageService(coin: coin)
        self.isLoading = true
        addSubscriber()
    }

    private func addSubscriber() {
        coinDataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImagw in
                self?.image = returnedImagw
            }
            .store(in: &camcellables)

    }
}
