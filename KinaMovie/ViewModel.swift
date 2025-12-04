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
        case failed(underlyingError: Error)
    }
    private(set) var homeStatus: fetchStatus = .notStarted
    private let dataFetcher = DataFetcher()
    var trendingMovies: [Title] = []
    var trendingTV: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []
    
    func getTitles() async {
        homeStatus = .fetching
        
        do {
            async let tMovies = dataFetcher.fetchTitles(for: "movie", by: "trending")
            async let tTV = try await dataFetcher.fetchTitles(for: "tv", by: "trending")
            async let tRMovies = try await dataFetcher.fetchTitles(for: "movie", by: "top_rated")
            async let tRTV = try await dataFetcher.fetchTitles(for: "tv", by: "top_rated")
            
            
            trendingMovies = try await tMovies
            trendingTV = try await tTV
            topRatedMovies = try await tRMovies
            topRatedTV = try await tRTV
            homeStatus = .success
        } catch {  
            print(error)
            homeStatus = .failed(underlyingError: error)
        }
    }
}
