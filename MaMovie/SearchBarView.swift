//
//  SearchBarView.swift
//  MaMovie
//
//  Created by Yusuf Burak on 20/03/2024.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.cyan)
            HStack {
                Image(systemName: "magnifyingglass")
                Text("Search a Movie, Show, Series...")
                Spacer()
            }
            .foregroundStyle(.secondary)
            .bold()
            .padding()
        }
    }
}

#Preview {
    SearchBarView()
}
