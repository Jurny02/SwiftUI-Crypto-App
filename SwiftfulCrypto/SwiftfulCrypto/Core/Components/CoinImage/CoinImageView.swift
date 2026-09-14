//
//  CoinImageView.swift
//  SwiftfulCrypto
//
//  Created by Bartosz Jurczyk on 14/09/2026.
//

import SwiftUI
import Combine



struct CoinImageView: View {
    @StateObject private var viewModel: CoinImageViewModel
    let coin: CoinModel
    init(
        coin: CoinModel
    ) {
        _viewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
        self.coin = coin
    }
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Image(systemName: "questionmark")
                        .foregroundStyle(Color.theme.secondaryText)
                }

            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .padding()
    }
}
