//
//  
//  BillboardView.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import SwiftUI

struct BillboardView: View {
    
    // MARK: - Propertiers
    @StateObject private var viewModel: BillboardViewModel = .init()
    @FetchRequest(fetchRequest: MovieCD.fetchRequestAll())
        var movies: FetchedResults<MovieCD>
    @FetchRequest(fetchRequest: RoutesCD.fetchRequestAll())
        var routes: FetchedResults<RoutesCD>
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    // MARK: - View
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(movies, id: \.self) { movie in
                    NavigationLink(destination:
                        BillboardDetailsView(movie: movie, routeTrailer: routeTrailer)
                    ) {
                        BillboardItemView(movie: movie, routePoster: routePoster)
                    }
                        .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal)
        }.onAppear(perform: viewModel.getMovies)
    }
    
    var routePoster: RoutesCD? {
        self.routes.first { $0.code == "poster" }
    }
    
    var routeTrailer: RoutesCD? {
        self.routes.first { $0.code == "trailer_mp4" }
    }
    
    // MARK: - funcs
}


struct BillboardView_Previews: PreviewProvider {
    static var previews: some View {
        BillboardView()
    }
}
