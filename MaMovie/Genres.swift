//
//  Genres.swift
//  MaMovie
//
//  Created by Yusuf Burak on 31/03/2024.
//

import Foundation

let genres: [Int: String] = [
    28: "Action",
    12: "Adventure",
    16: "Animation",
    35: "Comedy",
    80: "Crime",
    99: "Documentary",
    18: "Drama",
    10751: "Family",
    14: "Fantasy",
    36: "History",
    27: "Horror",
    10402: "Music",
    9648: "Mystery",
    10749: "Romance",
    878: "Science Fiction",
    10770: "TV Movie",
    53: "Thriller",
    10752: "War",
    37: "Western"
]

func genreNames(from ids: [Int]) -> [String] {
    return ids.compactMap { genres[$0] }
}
