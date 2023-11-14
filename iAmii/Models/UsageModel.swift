//
//  UsageModel.swift
//  iAmii
//
//  Created by Dominik Leszczyński on 12/11/2023.
//

import Foundation

struct UsageModel: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case gameID, gameName, amiiboUsage
    }
    
    let id = UUID()
    let gameID: [String] // ID will be repeated when figure has multiple uses for the same game
    let gameName: String
    let amiiboUsage: [GameUsageModel]
}

struct GameUsageModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case usage = "Usage"
        case write
    }
    
    let usage: String
    let write: Bool
}
