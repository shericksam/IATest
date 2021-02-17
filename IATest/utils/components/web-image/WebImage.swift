//
//  WebImage.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//

import SwiftUI

struct WebImage: View {
    
    @StateObject var loader: WebImageLoader
    var displayLoadingImg: Bool
    var padding: CGFloat?
    var contentMode: ContentMode?
    
    var body: some View {
        if let uiImg = loader.image {
            Image(uiImage: uiImg)
                .resizable()
                .aspectRatio(contentMode: contentMode ?? .fit)
                .clipped()
        } else if displayLoadingImg {
             defaultImage
        } else {
            VStack {}
        }
    }
    
    var defaultImage: some View {
        Image(systemName: "ellipsis.rectangle.fill")
            .resizable()
            .scaledToFit()
            .padding(.all, padding ?? 12)
            .foregroundColor(Color("gray3"))
            .clipped()
    }
    
}

struct WebImage_Previews: PreviewProvider {
    static var previews: some View {
        WebImage(loader: WebImageLoader(urlString: "https://www.talkwalker.com/images/2020/blog-headers/image-analysis.png"), displayLoadingImg: true)
    }
}
