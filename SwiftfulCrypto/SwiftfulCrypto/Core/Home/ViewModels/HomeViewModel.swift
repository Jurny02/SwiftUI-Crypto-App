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

    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []


    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }

}
