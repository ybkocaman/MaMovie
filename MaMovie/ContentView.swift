//
//  ContentView.swift
//  MaMovie
//
//  Created by Yusuf Burak on 18/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    if searchText.isEmpty != false {
                        InCinemaView(shows: viewModel.inCinemaResults?.results ?? [])
                            .padding()
                        TrendingMovieView(shows: viewModel.trendingMovieResults?.results ?? [])
                            .padding()
                        TrendingSeriesView(shows: viewModel.trendingSeriesResults?.results ?? [])
                            .padding()
                    } else {
                        SearchResultView(results: viewModel.searchResults?.results ?? [])
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .background(.green.opacity(0.5))
            .onAppear {
                viewModel.fetchTrendingMovie()
                viewModel.fetchTrendingSeries()
                viewModel.fetchInCinema()
            }
            .navigationTitle("MaMovie")
            .onChange(of: searchText) {
                viewModel.search(term: searchText)
            }
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    ContentView()
}
