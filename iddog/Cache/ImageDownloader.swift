//
//  ImageDownloader.swift
//  iddog
//
//  Created by Marcelo Banhos on 17/11/19.
//  Copyright © 2019 Marcelo Banhos. All rights reserved.
//

import UIKit

class ImageDownloader {
    
    let imageCache = NSCache<NSString, UIImage>()
    
    static func downloadImage(url: URL, completion: @escaping (_ image: UIImage?, _ error: Error? ) -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage, nil)
        } else {
            MTAPIClient.downloadData(url: url) { data, response, error in
                if let error = error {
                    completion(nil, error)
                    
                } else if let data = data, let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    completion(image, nil)
                } else {
                    completion(nil, NSError.generalParsingError(domain: url.absoluteString))
                }
            }
        }
    }
    
}
