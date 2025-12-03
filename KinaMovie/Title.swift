//
//  Title.swift
//  KinaMovie
//
//  Created by Fitrat on 12/2/25.
//

import Foundation

struct APIObject: Decodable {
    var results: [Title] = []
}
struct Title: Decodable, Identifiable {
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
    
    static var previewTitles = [
        Title(id: 1, title: "BeetleJuice", name: "BeetleJuice", overview: "A movie about BeetleJuice", posterPath: Constants.testTitleURl),
        Title(id: 2, title: "Avengers", name: "Avengers", overview: "Movie about a group of superheroes", posterPath: Constants.testTitleURl2),
        Title(id: 3, title: "Superman", name: "Superman", overview: "Movie about a an alien kid landing on Earth and growing up to be its hero", posterPath: Constants.testTitleUR3)
    ]
}
