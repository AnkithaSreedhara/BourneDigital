//
//  Response.swift
//  BourneDigital
//
//  Created by Sai Ankitha Sreedhara on 13/10/21.
//

import Foundation

// MARK: - Response

class Response: Codable {
    let title: String
    let movies: [Movie]

    init(title: String, movies: [Movie]) {
        self.title = title
        self.movies = movies
    }
}

// MARK: - Movie

class Movie: Codable, Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title &&
        lhs.imageHref == rhs.imageHref &&
        lhs.rating == rhs.rating &&
        lhs.releaseDate == rhs.releaseDate
    }
    let title: String
    let imageHref: String?
    let rating: Double?
    let releaseDate: String

    init(title: String, imageHref: String?, rating: Double?, releaseDate: String) {
        self.title = title
        self.imageHref = imageHref
        self.rating = rating
        self.releaseDate = releaseDate
    }
}
