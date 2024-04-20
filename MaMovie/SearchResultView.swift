//
//  SearchResultView.swift
//  MaMovie
//
//  Created by Yusuf Burak on 03/04/2024.
//

import SwiftUI

struct SearchResultView: View {
    var results: [Show]
    
    var body: some View {
        ForEach(results, id: \.self) { show in
            NavigationLink(destination: ShowView(show: show)) {
                HStack {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(show.backdrop_path)")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Rectangle()
                            .fill(.cyan)
                    }
                    .frame(width: 80)
                    .clipShape(.rect(cornerRadius: 5))
                    Text(show.title!)
                        .padding(.horizontal, 10)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .foregroundStyle(.black)
                .padding(.horizontal)
                .padding(.vertical, 10)
            }
        }
    }
}

//#Preview {
//    SearchResultView()
//}
