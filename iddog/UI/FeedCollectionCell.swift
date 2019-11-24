//
//  FeedCollectionCell.swift
//  iddog
//
//  Created by Marcelo Banhos on 17/11/19.
//  Copyright © 2019 Marcelo Banhos. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    let imageCache = NSCache<NSString, UIImage>()
    @IBOutlet weak var foto: UIImageView!
    
    func configuraCelula(_ feedVM: FeedViewModel) {
        
        guard let url = URL(string: feedVM.url!) else { return }
        
        Cache.downloadImage(url: url) { (image, error) in
            if let image = image {
                DispatchQueue.main.async() {
                    self.foto.image = image
                }
            }
        }
        
        
    
    }
}
