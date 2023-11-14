//
//  SeriesModel.swift
//  iAmii
//
//  Created by Dominik Leszczyński on 21/10/2023.
//

struct RequestSeriesModel: Decodable {
    let amiibo: [SeriesModel]
}
 
struct SeriesModel: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "key"
        case name
    }
    let id: String
    let name: String
}
