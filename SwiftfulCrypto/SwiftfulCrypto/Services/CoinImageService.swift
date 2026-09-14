//
//  CoinImageService.swift
//  SwiftfulCrypto
//
//  Created by Bartosz Jurczyk on 15/09/2026.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {

    @Published var coinImage: UIImage? = nil

    private var imageSubscrition: AnyCancellable?
    private let coin: CoinModel

    init(coin: CoinModel) {
        self.coin = coin
        getCoinImage()
    }

    private func getCoinImage() {
        guard let url = URL(
            string: coin.image
        ) else {
            return
        }

        imageSubscrition = NetworkingManager.download(url: url)
            .tryMap { data -> UIImage? in
                UIImage(data: data)
            }
            .sink(receiveCompletion: NetworkingManager.handleCompletion) { [weak self] (returnedImage) in
                self?.coinImage = returnedImage
                self?.imageSubscrition?.cancel()
            }
    }
}
