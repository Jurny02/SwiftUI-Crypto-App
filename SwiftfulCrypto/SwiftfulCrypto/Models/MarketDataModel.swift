//
//  MarketDataModel.swift
//  SwiftfulCrypto
//
//  Created by Bartosz Jurczyk on 19/09/2026.
//

import Foundation



/*
 JSON
 {
 "data": {
 "active_cryptocurrencies": 17397,
 "upcoming_icos": 0,
 "ongoing_icos": 49,
 "ended_icos": 3376,
 "markets": 1476,
 "total_market_cap": {
 "btc": 34570737.199462704,
 "eth": 1259418635.423994,
 "usd": 2621040321355.0405
 },
 "total_volume": {
 "btc": 1254779.1727158197,
 "eth": 45711847.69194817,
 "usd": 95133256404.37308
 },
 "market_cap_percentage": {
 "btc": 57.9539332566265,
 "eth": 9.58227145398409,
 "usdt": 7.223241338072757
 },
 "market_cap_change_percentage_24h_usd": -1.6081983639177684,
 "volume_change_percentage_24h_usd": 33.064521460740046,
 "updated_at": 1779878351
 }
 }
 */

//    url = https://pro-api.coingecko.com/api/v3/global

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {

    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }

    var markertCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            "$\(item.value.formattedWithAbbreviations())"
        } else {
            ""
        }
    }

    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            "$\(item.value.formattedWithAbbreviations())"
        } else {
            ""
        }
    }

    var bitcoinDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            item.value.asPercentString()
        } else {
            ""
        }
    }
}
