//
//  AmiiboModel.swift
//  iAmii
//
//  Created by Dominik Leszczyński on 21/10/2023.
//

typealias Amiibos = [AmiiboModel]

struct RequestAmiiboModel: Decodable {
    let amiibo: Amiibos
}

struct AmiiboModel: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "tail"
        case amiiboSeries
        case character
        case gameSeries
        case image
        case name
        case release
        case type
        case games3DS
        case gamesSwitch
        case gamesWiiU
    }
    
    let id: String
    let amiiboSeries: String
    let character: String
    let gameSeries: String
    let image: String
    let name: String
    let release: [Region: String?]
    let type: String
    let games3DS: [UsageModel]
    let gamesSwitch: [UsageModel]
    let gamesWiiU: [UsageModel]
}

enum Region: String, Decodable, CodingKeyRepresentable {
    case au
    case eu
    case jp
    case na
    
    var emoji: String {
        switch self {
        case .au: return "🇦🇺"
        case .eu: return "🇪🇺"
        case .jp: return "🇯🇵"
        case .na: return "🇺🇸"
        }
    }
}
