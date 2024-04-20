//
//  MovieView.swift
//  MaMovie
//
//  Created by Yusuf Burak on 20/03/2024.
//

import SwiftUI

struct ShowView: View {
    
    var show: Show
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(show.poster_path)")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 30))
                    } placeholder: {
                        ProgressView()
                    }
                    
                    
                    Text(show.name ?? show.title ?? "Unknown Name")
                        .font(.largeTitle.bold())
                        .padding()
                    
                    HStack {
                        if let dateString = show.release_date, let firstComponent = dateString.split(separator: "-").first {
                            Text(firstComponent)
                                .font(.subheadline.bold())
                                .padding(5)
                                .background(.purple.opacity(0.6))
                                .clipShape(.rect(cornerRadius: 10))
                        }
                        Spacer()
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundStyle(.blue)
                            .bold()
                        Text(String((show.vote_average * 10).rounded() / 10))
                            .foregroundStyle(.blue)
                            .bold()
                        Text("(\(show.vote_count))")
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            let genreNames = genreNames(from: show.genre_ids)
                            ForEach(genreNames, id: \.self) { genreName in
                                Text(genreName)
                                    .font(.subheadline)
                                    .padding(5)
                                    .background(.cyan)
                                    .clipShape(.rect(cornerRadius: 10))
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("About Show")
                            .font(.title3.bold())

                        Text(show.overview)
                            .padding(.vertical, 5)
                        
                    }
                    .padding(.vertical)
                    .padding()
                    
                }
            }
            .background(.green.opacity(0.6))
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    ShowView(show: .preview)
}
