//
//  SearchResults.swift
//  MaMovie
//
//  Created by Yusuf Burak on 02/04/2024.
//

import Foundation

struct SearchResult: Codable, Hashable {
    let page: Int
    let results: [Show]
    let total_pages: Int
    let total_results: Int
}
