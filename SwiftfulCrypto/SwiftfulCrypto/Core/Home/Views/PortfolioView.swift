//
//  PortfolioView.swift
//  SwiftfulCrypto
//
//  Created by Bartosz Jurczyk on 20/09/2026.
//

import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false


    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    coinLogoList

                    if let currentSelectedCoin = selectedCoin {
                        portfolioInputSection(currentSelectedCoin: currentSelectedCoin)
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton(dismiss: dismiss.callAsFunction)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    trailingNavBarButtons
                }
            }
        }
    }
}

extension PortfolioView {
    private var coinLogoList: some View {
        ScrollView(
            .horizontal,
            showsIndicators: false
        ) {
            LazyHStack(spacing: 10) {
                ForEach(vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            selectedCoin = coin
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    selectedCoin?.id == coin.id ?
                                    Color.theme.green : Color.clear,
                                    lineWidth: 1
                                )
                        }
                }
            }
            .frame(height: 120)
            .padding(.leading)
        }
    }

    private func portfolioInputSection(currentSelectedCoin: CoinModel) -> some View {
        VStack(spacing: 20) {
            HStack {
                Text("Current price of \(currentSelectedCoin.symbol.uppercased()):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }

            Divider()

            HStack {
                Text("Amount holding")
                Spacer()

                TextField("Ex: 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }

            Divider()

            HStack {
                Text("Current value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .animation(.none)
        .padding()
        .font(.headline)
    }

    private func getCurrentValue() -> Double {
        guard let quantity = Double(quantityText),
              let currentPrice = selectedCoin?.currentPrice
        else {
            return 0
        }

        return quantity * currentPrice
    }

    private var trailingNavBarButtons: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckmark ? 1.0 : 0.0)
            Button {
                saveButtonPressed()
            } label: {
                Text("Save".uppercased())
            }
            .opacity(
                (selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText)) ?
                1.0 : 0.0
            )

        }
        .font(.headline)
    }

    private func saveButtonPressed() {
        guard let coin = selectedCoin else { return }

        // save to portfolio

        // show checkmark

        withAnimation {
            showCheckmark = true
            removeSelectedCoin()
        }

        // hide keyboard

        UIApplication.shared.endEditing()

        // hide checkmark

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeOut) {
                showCheckmark = false
            }
        }
    }

    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PortfolioView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
                .environmentObject(dev.homeVM)

            PortfolioView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .environmentObject(dev.homeVM)
        }
    }
}

