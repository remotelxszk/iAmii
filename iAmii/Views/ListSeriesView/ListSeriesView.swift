//
//  ListSeriesView.swift
//  iAmii
//
//  Created by Dominik Leszczyński on 21/10/2023.
//

import SwiftUI

struct ListSeriesView: View {
    @ObservedObject var viewModel: ListSeriesViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.seriesArray) { series in
                    NavigationLink(destination: SeriesView(
                        viewModel: .init(seriesKey: series.id, seriesName: series.name)
                    )) {
                        Text(series.name)
                            .foregroundColor(Asset.textColor.swiftUIColor)
                            .lineLimit(1)
                    }
                    .listRowBackground(Asset.secondaryBackgroundColor.swiftUIColor)
                }
                .scrollContentBackground(.hidden)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("iAmii")
                        .font(.title2)
                        .foregroundColor(Asset.textColor.swiftUIColor)
                        .shadow(color: Asset.shadowColor.swiftUIColor, radius: 5)
                }
            }
            .background(Asset.backgroundColor.swiftUIColor.ignoresSafeArea())
            .overlay(content: {
                if viewModel.isLoading { ProgressView() }
            })
            .onAppear(perform: viewModel.loadSeries)
        }
    }
}

struct ListSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        ListSeriesView(viewModel: .init())
    }
}
