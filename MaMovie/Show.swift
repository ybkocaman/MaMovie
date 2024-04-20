//
//  Show.swift
//  MaMovie
//
//  Created by Yusuf Burak on 27/03/2024.
//

import Foundation

struct Show: Codable, Hashable {
    let id: Int
    let name: String?
    let title: String?
    let poster_path: String
    let vote_average: Double
    let vote_count: Int
    let backdrop_path: String
    let overview: String
    let genre_ids: [Int]
    let release_date: String?
    
    static var preview: Show {
        return Show(
            id: 693134,
            name: nil,
            title: "Dune: Part Two",
            poster_path: "/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg",
            vote_average: 8.3,
            vote_count: 2818,
            backdrop_path: "/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg",
            overview: "Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.",
            genre_ids: [878, 12],
            release_date: "2024-02-27")
    }
    
}
