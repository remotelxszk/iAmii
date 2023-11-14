//
//  GameUsageViewModel.swift
//  iAmii
//
//  Created by Dominik Leszczyński on 05/11/2023.
//

final class GameUsageViewModel {
    let console: ConsoleEnum
    let gameUsage: [UsageModel]
    
    init(console: ConsoleEnum, gameUsage: [UsageModel]) {
        self.console = console
        self.gameUsage = gameUsage
    }
}
