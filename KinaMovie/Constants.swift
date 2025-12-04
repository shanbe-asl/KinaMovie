//
//  Constants.swift
//  KinaMovie
//
//  Created by Fitrat on 12/1/25.
//

import Foundation
import SwiftUI


struct Constants{
    static let homeString = "Home"
    static let upcomingString = "Upcoming"
    static let searchString = "Search"
    static let downloadString = "Download"
    static let playString = "Play"
    static let trendingMoviesString = "Trending Movies"
    static let trendingTVString = "Trending TV"
    static let topRatedMovieString = "Top Rated Movies"
    static let topRatedTVString = "Top Rated Tv"
    
    static let homeIconString = "house"
    static let upcomingIconString = "play.circle"
    static let searchIconString = "magnifyingglass"
    static let downloadIconString = "arrow.down.to.line"

    static let testTitleURl = "https://images.pexels.com/photos/33245092/pexels-photo-33245092.jpeg"
    static let testTitleURl2 = "https://images.pexels.com/photos/30709448/pexels-photo-30709448.jpeg"
    static let testTitleUR3 = "https://images.pexels.com/photos/9807280/pexels-photo-9807280.jpeg"
    
    static let posterURLStart = "https://image.tmdb.org/t/p/w500"
    
    static func addPosterPath(to titles: inout[Title]){
        for index in titles.indices{
            if let path = titles[index].posterPath{
                titles[index].posterPath = Constants.posterURLStart + path
            }
        }
    }
}

extension Text{
    func ghostButton() -> some View{
        self
            .frame(width: 100, height: 50)
            .foregroundStyle(.buttonText)
            .bold()
            .background{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.buttonBorder,lineWidth: 5)
            }
    }
}
