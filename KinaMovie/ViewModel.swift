//
//  ViewModel.swift
//  KinaMovie
//
//  Created by Fitrat on 12/3/25.
//

import Foundation

@Observable
class ViewModel {
    enum fetchStatus {
        case notStarted
        case fetching
        case success
        case failure(underlyingError: Error)
    }
    private(set) var homeStatus: fetchStatus = .notStarted
    private let dataFetcher = DataFetcher()
    var trendingMovies: [Title] = []
    
    func getTitle() async {
        homeStatus = .fetching
        
        do {
            trendingMovies = try await dataFetcher.fetchTitles(for: "movie")
            homeStatus = .success
        } catch {
            print(error)
            homeStatus = .failure(underlyingError: error)
        }
    }
}
