//
//  FotoViewController.swift
//  iddog
//
//  Created by Marcelo Banhos on 23/11/19.
//  Copyright © 2019 Marcelo Banhos. All rights reserved.
//

import UIKit

class FotoViewController: UIViewController {
    
    @IBOutlet weak var fotoImageView: UIImageView!
    
    var fotoVM = FotoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: fotoVM.url!) else { return }
        
        Cache.downloadImage(url: url) { (image, error) in
            if let image = image {
                DispatchQueue.main.async() {
                    self.fotoImageView.image = image
                }
            }
        }
        
    }
    
    
    
}
