//
//  AmiiboView.swift
//  iAmii
//
//  Created by Dominik Leszczyński on 01/11/2023.
//

import SwiftUI

struct AmiiboView: View {
    @StateObject var viewModel: AmiiboViewModel
    
    var body: some View {
        ZStack {
            Asset.backgroundColor.swiftUIColor.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 0) {
                    Text(viewModel.amiiboFigure.name)
                        .font(.title)
                        .foregroundColor(Asset.textColor.swiftUIColor)
                        .lineLimit(2)
                        .padding(.bottom, 10)
                    Text(viewModel.amiiboFigure.type)
                        .foregroundColor(Asset.textColor.swiftUIColor)
                        .lineLimit(1)
                    Spacer(minLength: 15)
                    AsyncImage(url: URL(string: viewModel.amiiboFigure.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    } placeholder: { ProgressView() }
                        .frame(height: 200)
                    Spacer(minLength: 15)
                    HStack(spacing: 20) {
                        VStack {
                            Button { viewModel.displayGameUsage(console: .switch) } label: {
                                Text("Switch Usage")
                                    .frame(width: 120)
                            }
                            .buttonStyle(.bordered)
                            .tint(Asset.redColor.swiftUIColor)
                            Button { viewModel.displayGameUsage(console: .threeDS) } label: {
                                Text("3DS Usage")
                                    .frame(width: 120)
                            }
                            .buttonStyle(.bordered)
                            .tint(Asset.orangeColor.swiftUIColor)
                            Button { viewModel.displayGameUsage(console: .wiiU) } label: {
                                Text("WiiU Usage")
                                    .frame(width: 120)
                            }
                            .buttonStyle(.bordered)
                            .tint(Asset.blueColor.swiftUIColor)
                        }
                        Text(viewModel.formatedReleases())
                            .foregroundColor(Asset.textColor.swiftUIColor)
                            .lineLimit(4)
                    }
                    GameUsageView(viewModel: .init(
                        console: viewModel.currentDisplayConsole,
                        gameUsage: viewModel.gameUsageArray
                    ))
                    .padding(.top, 10)
                }
                .padding()
                .shadow(color: Asset.shadowColor.swiftUIColor, radius: 2)
            }
        }
    }
}

struct AmiiboView_Previews: PreviewProvider {
    static var previews: some View {
        VStack { EmptyView() }
            .sheet(isPresented: .constant(true)) {
                AmiiboView(viewModel: .init(
                    amiiboFigure: PreviewModels.amiiboModel,
                    currentViewDetent: .constant(.medium)
                ))
                .presentationDetents([.medium])
            }
    }
}
