//
//  ViewModel.swift
//  MaMovie
//
//  Created by Yusuf Burak on 24/03/2024.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var trendingMovieResults: ShowResults?
    @Published var trendingSeriesResults: ShowResults?
    @Published var inCinemaResults: InCinemaResults?
    @Published var searchResults: ShowResults?
    
    func fetchTrendingMovie() {
        let apiKeyExtension = "?api_key=1e7442c4621ac0810f4ccd69e511ab92"
        let endPoint = "https://api.themoviedb.org/3/trending/movie/week\(apiKeyExtension)"
        guard let url = URL(string: endPoint) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let trendingResults = try JSONDecoder().decode(ShowResults.self, from: data)
                DispatchQueue.main.async {
                    self.trendingMovieResults = trendingResults
                }
            } catch {
                print("Error occured while decoding the trending result data: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    func fetchTrendingSeries() {
        let apiKeyExtension = "?api_key=1e7442c4621ac0810f4ccd69e511ab92"
        let endPoint = "https://api.themoviedb.org/3/trending/tv/week\(apiKeyExtension)"
        guard let url = URL(string: endPoint) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let trendingResults = try JSONDecoder().decode(ShowResults.self, from: data)
                DispatchQueue.main.async {
                    self.trendingSeriesResults = trendingResults
                }
            } catch {
                print("Error occured while decoding the trending result data: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    func fetchInCinema() {
        let apiKeyExtension = "?api_key=1e7442c4621ac0810f4ccd69e511ab92"
        let endPoint = "https://api.themoviedb.org/3/movie/now_playing\(apiKeyExtension)"
        guard let url = URL(string: endPoint) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let inCinemaResults = try JSONDecoder().decode(InCinemaResults.self, from: data)
                DispatchQueue.main.async {
                    self.inCinemaResults = inCinemaResults
                }
            } catch {
                print("Error occured while decoding the in cinema result data: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    func search(term: String) {
        let apiKeyExtension = "?api_key=1e7442c4621ac0810f4ccd69e511ab92"
        let endpoint = "https://api.themoviedb.org/3/search/movie\(apiKeyExtension)&language=en-US&page=1&query=\(term)"
        guard let url = URL(string: endpoint) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let searchResults = try JSONDecoder().decode(ShowResults.self, from: data)
                DispatchQueue.main.async {
                    self.searchResults = searchResults
                }
            } catch {
                print("Error occured while decoding the search result data: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
}
