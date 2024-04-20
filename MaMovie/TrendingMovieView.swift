//
//  TrendingView.swift
//  MaMovie
//
//  Created by Yusuf Burak on 20/03/2024.
//

import SwiftUI

struct TrendingMovieView: View {
    var shows: [Show]
    
    var body: some View {
        VStack {
            HStack {
                Text("Trending Movies")
                    .bold()
                Spacer()
                Text("See all >")
                    .foregroundStyle(.secondary)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(shows, id: \.self) { show in
                        NavigationLink(destination: ShowView(show: show)) {
                            VStack(spacing: 0) {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(show.backdrop_path)")) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 240, height: 135)
                                } placeholder: {
                                    Rectangle()
                                        .fill(.cyan)
                                }
                                    
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(show.title ?? "No available name")
                                            .foregroundStyle(.white)
                                            .bold()
                                        HStack {
                                            Image(systemName: "hand.thumbsup.fill")
                                                .foregroundStyle(.yellow)
                                            Text(String((show.vote_average * 10).rounded() / 10))
                                                .foregroundStyle(.yellow)
                                        }
                                    }
                                    Spacer()
                                    Image(systemName: "heart")
                                        .font(.title)
                                        .foregroundStyle(.red)
                                }
                                .padding(.horizontal, 5)
                                .frame(width: 240, height: 60)
                                .background(.cyan)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    TrendingView(shows: <#T##[Show]#>)
//}
