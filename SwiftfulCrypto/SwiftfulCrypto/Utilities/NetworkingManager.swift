//
//  NetworkingManager.swift
//  SwiftfulCrypto
//
//  Created by Bartosz Jurczyk on 14/09/2026.
//

import Foundation
import Combine

class NetworkingManager {
    enum NetworkingError: LocalizedError {
        case badUrlResponse(url: URL)
        case unknown

        var errorDescription: String? {
            switch self {

            case .badUrlResponse(let url):
                "badUrlResponse with\(url)"
            case .unknown:
                "unknown"
            }
        }


    }

    static func download(url: URL) -> AnyPublisher<Data, any Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { try handleURLResponse(output: $0, url: url)

            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badUrlResponse(url: url)

        }
        return output.data
    }

    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
