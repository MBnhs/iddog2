//
//  FeedViewModel.swift
//  iddog
//
//  Created by Marcelo Banhos on 17/11/19.
//  Copyright © 2019 Marcelo Banhos. All rights reserved.
//

import Foundation

struct FeedListViewModel {
    private var feedListViewModel = [FeedViewModel]()
    
    mutating func adicionaFeedViewModel(_ vm: FeedViewModel) {
        self.feedListViewModel.append(vm)
    }
    
    func numeroDeLinhas() -> Int {
        return self.feedListViewModel.count
    }
    
    func modelNo(_ indice: Int) -> FeedViewModel {
        return feedListViewModel[indice]
    }
    
}


struct FeedViewModel {
    
    var categoria: String?
    var url: String?
}
