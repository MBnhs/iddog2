//
//  Feed.swift
//  iddog
//
//  Created by Marcelo Banhos on 17/11/19.
//  Copyright © 2019 Marcelo Banhos. All rights reserved.
//

import Foundation

struct Feed: Codable {
    
    let category: String?
    let list: [String]?
    
    
}

extension Feed {
    
    static func list(vm: FeedViewModel)-> Resource<Feed> {
        let feed = Feed(vm)
        
        var categoria = "husky"
        
        if let feed = feed, let category = feed.category {
            categoria = category
        }
        
        guard let url = URL(string: "https://api-iddog.idwall.co/feed?category=\(categoria)") else {
            fatalError("URL incorreta")
        }
        
        var resource = Resource<Feed>(url: url)
        
        resource.authorization = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJpZGRvZy1zZXJ2aWNlIiwic3ViIjoiNWRkMGE4MWY0NzRkYWFjOTQ2YjIwMmIwIiwiaWF0IjoxNTczOTU1NjE1LCJleHAiOjE1NzUyNTE2MTV9.YZc19s2olPGLkjVzTyKhwNqvGeWAo9lsG0Hia4phjUE"
        
        return resource
        
    }
    
}

extension Feed {
    
    init?(_ feedViewModel: FeedViewModel) {
        
        guard let categoria = feedViewModel.categoria else {
            return nil
        }
        
        self.category = categoria
        self.list = nil
        
    }
    
}
