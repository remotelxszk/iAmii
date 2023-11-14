//
//  ListSeriesViewModel.swift
//  iAmii
//
//  Created by Dominik Leszczyński on 21/10/2023.
//

import SwiftUI
import Combine

final class ListSeriesViewModel: ObservableObject {
    private let networkService = NetworkService()
    @Published var seriesArray = [SeriesModel]()
    @Published var isLoading = false
    
    private var anyCancellables = Set<AnyCancellable>()
    
    func loadSeries() {
        isLoading = true
        networkService.fetchAllSeries()
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    print(error) // TODO: Add error handling
                    return
                case .finished: return
                }
            } receiveValue: { [weak self] receivedSeries in
            self?.seriesArray = receivedSeries
        }.store(in: &anyCancellables)
    }
}
