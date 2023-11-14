//
//  SeriesViewCell.swift
//  iAmii
//
//  Created by Dominik Leszczyński on 01/11/2023.
//

import SwiftUI

struct SeriesViewCell: View {
    let amiibo: AmiiboModel
    
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(
                url: URL(string: amiibo.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                } placeholder: { ProgressView() }
            Text(amiibo.name)
                .font(.title3)
                .foregroundColor(Asset.textColor.swiftUIColor)
                .minimumScaleFactor(0.7)
                .lineLimit(1)
        }
        .padding()
        .shadow(color: Asset.shadowColor.swiftUIColor, radius: 2)
        .frame(width: 150, height: 150)
        .background(Asset.secondaryBackgroundColor.swiftUIColor)
        .cornerRadius(10)
    }
}

struct SeriesViewCell_Previews: PreviewProvider {
    static var previews: some View {
        SeriesViewCell(amiibo: PreviewModels.amiiboModel)
    }
}
