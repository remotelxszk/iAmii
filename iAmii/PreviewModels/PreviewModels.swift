//
//  PreviewModels.swift
//  iAmii
//
//  Created by Dominik Leszczyński on 02/11/2023.
//

class PreviewModels {
    static let amiiboModel = AmiiboModel(
        id: "02540c02",
        amiiboSeries: "Kirby",
        character: "Kirby",
        gameSeries: "Kirby",
        image: "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_1f000000-02540c02.png",
        name: "Kirby",
        release: release,
        type: "Figure",
        games3DS: gameModels,
        gamesSwitch: gameModels,
        gamesWiiU: gameModels
    )
    static let amiiboModels = Amiibos.init(repeating: amiiboModel, count: 4)
    static let release: [Region: String?] = [
        .au: "2016-06-11", .eu: "2016-06-10",
        .jp: "2016-04-28", .na: "2016-06-10"
    ]
    static let seriesKey = "0x0c"
    static let seriesName = "Kirby"
    static let gameModel = UsageModel(
        gameID: ["01004D300C5AE000"],
        gameName: "Kirby and the Forgotten Land",
        amiiboUsage: [.init(usage: "Receive star coins and a boost item", write: false)]
    )
    static let gameModels = [UsageModel].init(repeating: gameModel, count: 4)
}
