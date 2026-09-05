//
//  CoinModel.swift
//  SwiftfulCrypto
//
//  Created by Bartosz Jurczyk on 05/09/2026.
//

import Foundation

struct CoinModel: Identifiable, Codable {

//    CG-3P83wSg91hNqr5QkEmwA6quy
    /*
     curl --request GET \
       --url 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h' \
       --header 'x-cg-demo-api-key: CG-3P83wSg91hNqr5QkEmwA6quy'



     {
       "id": "bitcoin",
       "symbol": "btc",
       "name": "Bitcoin",
       "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
       "current_price": 77671,
       "market_cap": 1555886872303,
       "market_cap_rank": 1,
       "fully_diluted_valuation": 1555914058873,
       "total_volume": 33235034316,
       "high_24h": 78419,
       "low_24h": 76696,
       "price_change_24h": -747.3360347281705,
       "price_change_percentage_24h": -0.95302,
       "market_cap_change_24h": -15184401491.513184,
       "market_cap_change_percentage_24h": -0.9665,
       "circulating_supply": 20030493,
       "total_supply": 20030843,
       "max_supply": 21000000,
       "ath": 126080,
       "ath_change_percentage": -38.39571,
       "ath_date": "2025-10-06T18:57:42.558Z",
       "atl": 67.81,
       "atl_change_percentage": 114443.23093,
       "atl_date": "2013-07-06T00:00:00.000Z",
       "roi": null,
       "last_updated": "2026-05-18T12:49:21.599Z",
       "market_cap_rank_with_rehypothecated": 1,
       "sparkline_in_7d": {
         "price": [
           81045.84776489827,
           81001.73089268175,
           80898.20817826076
         ]
       },
       "price_change_percentage_1h_in_currency": 0.5823392426906319,
       "price_change_percentage_24h_in_currency": -0.9530164743774191,
       "price_change_percentage_7d_in_currency": -4.042267423689584,
       "price_change_percentage_14d_in_currency": -1.5720857443461431,
       "price_change_percentage_30d_in_currency": 1.9453890367549207,
       "price_change_percentage_200d_in_currency": -29.452371850925864,
       "price_change_percentage_1y_in_currency": -25.214612207475373
     }
   ]
    */
    // This file was generated from JSON Schema using quicktype, do not modify it directly.
    // To parse the JSON, add this file to your project and do:
    //
    //   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let marketCap: Double?
    let marketCapRank: Double?
    let fullyDilutedValuation: Double?
    let totalVolume: Double?
    let high24H: Double?
    let low24H: Double?
    let priceChange24H: Double?
    let priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply: Double?
    let totalSupply: Double?
    let maxSupply: Double?
    let ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl: Double?
    let atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case symbol = "symbol"
        case name = "name"
        case image = "image"
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath = "ath"
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl = "atl"
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "roi"
        case sparklineIn7D = "last_updated"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }

    func updateHoldings(amount: Double) -> CoinModel {
        CoinModel(
            id: id,
            symbol: symbol,
            name: name,
            image: image,
            currentPrice: currentPrice,
            marketCap: marketCap,
            marketCapRank: marketCapRank,
            fullyDilutedValuation: fullyDilutedValuation,
            totalVolume: totalVolume,
            high24H: high24H,
            low24H: low24H,
            priceChange24H: priceChange24H,
            priceChangePercentage24H: priceChangePercentage24H,
            marketCapChange24H: marketCapChange24H,
            marketCapChangePercentage24H: marketCapChangePercentage24H,
            circulatingSupply: circulatingSupply,
            totalSupply: totalSupply,
            maxSupply: maxSupply,
            ath: ath,
            athChangePercentage: athChangePercentage,
            athDate: athDate,
            atl: atl,
            atlChangePercentage: atlChangePercentage,
            atlDate: atlDate,
            lastUpdated: lastUpdated,
            sparklineIn7D: sparklineIn7D,
            priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency,
            currentHoldings: amount
        )
    }

    var currentHoldingsValue: Double {
        return currentPrice * (currentHoldings ?? 0)
    }

    var rank: Int {
        Int(marketCapRank ?? 0)
    }
}

// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]?
}
