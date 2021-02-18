//
//  
//  BillboardItemView.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import SwiftUI

struct BillboardItemView: View {
    
    // MARK: - Propertiers
    var movie: MovieCD
    var routePoster: RoutesCD?
    @StateObject var imgLoader = WebImageLoader(urlString: nil)
    @State var hasImage: Bool = false
    
    // MARK: - View
    var body: some View {
        VStack {
            if hasImage {
                WebImage(loader: imgLoader, displayLoadingImg: false)
                    .frame(height: 150)
                    .background(Color(.systemBackground))
            } else {
                Image(systemName: "eye.slash")
                    .resizable()
                    .frame(minHeight: 150)
                    .scaledToFit()
            }
            Text("\(movie.name ?? "no name")")
                .bold()
                .lineLimit(1)
                .truncationMode(.tail)
        }
        .onAppear {
            let poster = movie.media?
                .map({ $0 as! MediaCD})
                .first(where: { $0.code == "poster" })
            guard let resource = poster?.resource,
                  let size = routePoster?.sizes?.medium else {
                self.hasImage = false
                return
            }
            self.hasImage = true
            imgLoader.urlString = "\(size)\(resource)"
            imgLoader.loadImage()
        }
    }
    
    // MARK: - funcs
}


//struct BillboardItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        BillboardItemView()
//    }
//}
