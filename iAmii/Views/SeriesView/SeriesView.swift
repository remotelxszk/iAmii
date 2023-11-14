//
//  SeriesView.swift
//  iAmii
//
//  Created by Dominik Leszczyński on 21/10/2023.
//

import SwiftUI

struct SeriesView: View {
    @ObservedObject var viewModel: SeriesViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.fixed(150), spacing: 20),
                              GridItem(.fixed(150), spacing: 20)],
                    spacing: 20
                ) {
                    ForEach(viewModel.amiiboArray, id: \.id) { amiibo in
                        Button(
                            action: { viewModel.selectedAmiibo = amiibo },
                            label: { SeriesViewCell(amiibo: amiibo) }
                        )
                    }
                }
            }
        }
        .sheet(item: $viewModel.selectedAmiibo, onDismiss: { viewModel.currentDetailViewDetent = .medium }, content: { selectedAmiibo in
            AmiiboView(viewModel: .init(
                amiiboFigure: selectedAmiibo, currentViewDetent: $viewModel.currentDetailViewDetent
            ))
            .presentationDetents([.medium, .large], selection: $viewModel.currentDetailViewDetent)
        })
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(viewModel.seriesName)
                    .font(.title2)
                    .foregroundColor(Asset.textColor.swiftUIColor)
                    .shadow(color: Asset.shadowColor.swiftUIColor, radius: 5)
            }
        }
        .background(Asset.backgroundColor.swiftUIColor.ignoresSafeArea())
        .overlay(content: {
            if viewModel.isLoading { ProgressView() }
        })
        .onAppear(perform: viewModel.loadAmiibos)
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(viewModel: .init(
            seriesKey: PreviewModels.seriesKey,
            seriesName: PreviewModels.seriesName
        ))
    }
}
