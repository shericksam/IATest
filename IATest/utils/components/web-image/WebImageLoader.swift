//
//  WebImageLoader.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//

import Foundation
import SwiftUI

class WebImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    var urlString: String? {
        didSet {
            loadImage()
        }
    }
    
    var imageCache = ImageCache.getImageCache()
    
    init(urlString: String?) {
        // print("url image:", urlString ?? "no hay url")
        self.urlString = urlString ?? ""
        loadImage()
    }
    
    func loadImage() {
        if loadImageFromCache() {
            // print("Cache Hit")
            return
        }
        // print("Cache miss trying loading from url")
        loadImageFomUrl()
    }
    
    func loadImageFromCache() -> Bool {
        guard let urlString = urlString else {
            return false
        }
        
        guard let cacheImage = imageCache.get(forKey: urlString) else {
            return false
        }
        
        image = cacheImage
        return true
    }
    
    func loadImageFomUrl() {
        guard let urlString = urlString, !urlString.isEmpty, let url = URL(string: urlString) else {
            return
        }
        //print(#function, urlString)
        let task = URLSession.shared.dataTask(with: url, completionHandler:
            getImageFromResponse(data:response:error:))
        task.resume()
    }
    
    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            // print("Error: \(error!)")
            return
        }
        
        guard let data = data else {
            // print("No data found")
            return
        }
        
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }
            self.imageCache.set(forKey: self.urlString!, image: loadedImage)
            self.image = loadedImage
        }
    }
    
}

class ImageCache {
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
    
}

extension ImageCache {
    
    private static var imageCache = ImageCache()
    
    static func getImageCache() -> ImageCache {
        return imageCache
    }
    
}

