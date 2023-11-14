//
//  SeriesViewModel.swift
//  iAmii
//
//  Created by Dominik Leszczyński on 21/10/2023.
//

import SwiftUI
import Combine

final class SeriesViewModel: ObservableObject {
    let seriesKey: String
    let seriesName: String
    
    @Published var amiiboArray = [AmiiboModel]()
    @Published var isLoading = false
    @Published var selectedAmiibo: AmiiboModel?
    @Published var currentDetailViewDetent: PresentationDetent = .medium
    
    private let networkService = NetworkService()
    private var anyCancellables = Set<AnyCancellable>()
    
    init(seriesKey: String, seriesName: String) {
        self.seriesKey = seriesKey
        self.seriesName = seriesName
    }
    
    func loadAmiibos() {
        isLoading = true
        networkService.fetchBySeries(seriesKey: seriesKey)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    print(error) // TODO: Add error handling
                    return
                case .finished: return
                }
            } receiveValue: { [weak self] receivedAmiibo in
            self?.amiiboArray = receivedAmiibo
        }.store(in: &anyCancellables)
    }
}
