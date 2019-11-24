//
//  File.swift
//  iddog
//
//  Created by Marcelo Banhos on 17/11/19.
//  Copyright © 2019 Marcelo Banhos. All rights reserved.
//

import UIKit

class Cache {
    
    static let imageCache = NSCache<NSString, UIImage>()
    
    private init(){}
    
    static func downloadImage(url: URL, completion: @escaping (_ image: UIImage?, _ error: Error? ) -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage, nil)
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(nil, error)
                    
                } else if let data = data, let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    completion(image, nil)
                } 
            }.resume()
        }
    }
    
    
}
