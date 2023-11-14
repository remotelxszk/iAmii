//
//  NetworkService.swift
//  iAmii
//
//  Created by Dominik Leszczyński on 21/10/2023.
//

import Foundation
import Combine

class NetworkService {
    private let urlSession = URLSession.shared
    
    func fetchAllSeries() -> AnyPublisher<[SeriesModel], Error> {
        guard let url = generateURL(path: "amiiboseries/") else {
            return Fail(
                outputType: [SeriesModel].self,
                failure: NSError() // TODO: Add specific error
            ).eraseToAnyPublisher()
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return urlSession.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: RequestSeriesModel.self, decoder: decoder)
            .map(\.amiibo)
            .map { $0.sorted(by: {$0.name < $1.name }) }
            .eraseToAnyPublisher()
    }
    
    func fetchBySeries(seriesKey: String) -> AnyPublisher<[AmiiboModel], Error> {
        guard let url = generateURL(path: "amiibo/", queryItems: [
            .init(name: "amiiboSeries", value: seriesKey),
            .init(name: "showusage", value: nil)
        ]) else {
            return Fail(
                outputType: [AmiiboModel].self,
                failure: NSError() // TODO: Add specific error
            ).eraseToAnyPublisher()
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return urlSession.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: RequestAmiiboModel.self, decoder: decoder)
            .map(\.amiibo)
            .map { $0.sorted(by: {$0.name < $1.name }) }
            .eraseToAnyPublisher()
    }
    
    private func generateURL(path: String, queryItems: [URLQueryItem]? = nil) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "amiiboapi.com"
        components.path = "/api/" + path
        components.queryItems = queryItems
        return components.url
    }
}
