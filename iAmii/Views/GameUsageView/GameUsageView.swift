//
//  GameUsageView.swift
//  iAmii
//
//  Created by Dominik Leszczyński on 05/11/2023.
//

import SwiftUI

struct GameUsageView: View {
    private let viewModel: GameUsageViewModel
    private var colorForConsole: Color {
        switch viewModel.console {
        case .switch: return Asset.redColor.swiftUIColor
        case .wiiU: return Asset.blueColor.swiftUIColor
        case .threeDS: return Asset.orangeColor.swiftUIColor
        case .none: return .clear
        }
    }
    
    init(viewModel: GameUsageViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text(viewModel.console.rawValue)
                .foregroundColor(colorForConsole)
                .lineLimit(1)
                .padding(.bottom, 10)
            ForEach(viewModel.gameUsage) { usage in
                Text(usage.gameName)
                    .lineLimit(2)
                Text(usage.amiiboUsage.first?.usage ?? "")
                    .font(.system(size: 12))
                    .lineLimit(3)
                Divider()
                    .padding(.vertical, 5)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Asset.textColor.swiftUIColor)
        }
    }
}

struct GameUsageView_Previews: PreviewProvider {
    static var previews: some View {
        VStack { EmptyView() }
            .sheet(isPresented: .constant(true)) {
                GameUsageView(viewModel: .init(
                    console: .switch,
                    gameUsage: PreviewModels.gameModels
                ))
                .presentationDetents([.medium])
            }
    }
}
