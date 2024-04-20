//
//  TrendingResults.swift
//  MaMovie
//
//  Created by Yusuf Burak on 27/03/2024.
//

import Foundation

struct ShowResults: Codable, Hashable {
    let page: Int
    let results: [Show]
    let total_pages: Int
    let total_results: Int
    
    init(page: Int, results: [Show], total_pages: Int, total_results: Int) {
        self.page = page
        self.results = results
        self.total_pages = total_pages
        self.total_results = total_results
    }
}
