//
//  JSONDecoder+snake.swift
//  SwiftfulCrypto
//
//  Created by Bartosz Jurczyk on 19/09/2026.
//

import Foundation

extension JSONDecoder {
    static var fromSnakeCase: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
