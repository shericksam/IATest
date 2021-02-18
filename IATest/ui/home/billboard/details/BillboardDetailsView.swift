//
//  
//  BillboardDetailsView.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import SwiftUI
import AVKit

struct BillboardDetailsView: View {
    
    // MARK: - Propertiers
    var movie: MovieCD
    var routeTrailer: RoutesCD?
    @State var player: AVPlayer? = nil
    
    init(movie: MovieCD, routeTrailer: RoutesCD?) {
        self.movie = movie
        self.routeTrailer = routeTrailer
    }
    
    // MARK: - View
    var body: some View {
        ScrollView {
            VStack {
                if player != nil {
                    VideoPlayer(player: player!)
                        .frame(height: 250, alignment: .center)
                        .onAppear() {
                            player!.play()
                        }
                }
                VStack {
                    HStack(alignment: .top) {
                        Text("name")
                            .bold()
                        Text("\(movie.originalName ?? "")")
                            .font(.body)
                        Spacer()
                    }
                    
                    HStack {
                        Text("classification")
                            .bold()
                        Text("\(movie.rating ?? "")")
                            .font(.body)
                        Spacer()
                    }
                    
                    HStack {
                        Text("genre")
                            .bold()
                        Text("\(movie.genre ?? "")")
                            .font(.body)
                        Spacer()
                    }
                    
                    HStack {
                        Text("duration")
                            .bold()
                        Text("\(movie.length ?? "--:--")")
                            .font(.body)
                        Spacer()
                    }
                    
                    VStack {
                        HStack {
                            Text("synopsis")
                                .bold()
                            Spacer()
                        }
                        Text("\(movie.synopsis ?? "")")
                            .font(.body)
                    }
                }
                .onAppear(perform: {
                    if let routeTrailer = routeTrailer,
                       let medium = routeTrailer.sizes?.medium,
                       let trailer = media?.resource {
                        self.player = AVPlayer(url: URL(string: "\(medium)\(trailer)")!)
                    }
                })
                    .padding()
            }
        }
        .onDisappear(perform: {
            player?.pause()
            player = nil
        })
        .navigationBarTitle("movie-detail")
    }
    
    var media: MediaCD? {
        movie.media?
            .map({ $0 as! MediaCD })
            .first(where: { $0.code == "trailer_mp4" })
    }
    // MARK: - funcs
}
