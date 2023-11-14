//
//  AmiiboViewModel.swift
//  iAmii
//
//  Created by Dominik Leszczyński on 01/11/2023.
//

import SwiftUI

final class AmiiboViewModel: ObservableObject {
    let amiiboFigure: AmiiboModel
    @Published var currentDisplayConsole: ConsoleEnum = .none
    @Published var gameUsageArray: [UsageModel] = []
    @Binding var currentViewDetent: PresentationDetent
    
    init(amiiboFigure: AmiiboModel, currentViewDetent: Binding<PresentationDetent>) {
        self.amiiboFigure = amiiboFigure
        self._currentViewDetent = currentViewDetent
    }
    
    func formatedReleases() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let nonNilRegions = amiiboFigure.release.compactMapValues { $0 }
        let nonNilDates = nonNilRegions.compactMapValues(dateFormatter.date(from:))
        dateFormatter.dateFormat = "d MMM, yyyy"
        let formattedArray = nonNilDates.map { "\($0.0.emoji) \(dateFormatter.string(from:$0.1))" }
        let sortedArray = formattedArray.sorted()
        return sortedArray.joined(separator: "\n")
    }
    
    func displayGameUsage(console: ConsoleEnum) {
        if currentDisplayConsole == console {
            currentDisplayConsole = .none
            gameUsageArray = getGameUsageForConsole()
            currentViewDetent = .medium
            return
        }
        currentDisplayConsole = console
        gameUsageArray = getGameUsageForConsole()
        currentViewDetent = .large
    }
    
    private func getGameUsageForConsole() -> [UsageModel] {
        switch currentDisplayConsole {
        case .threeDS:
            return amiiboFigure.games3DS
        case .wiiU:
            return amiiboFigure.gamesWiiU
        case .switch:
            return amiiboFigure.gamesSwitch
        case .none:
            return []
        }
    }
}
