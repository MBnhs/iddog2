//
//  GaleriaViewController.swift
//  iddog
//
//  Created by Marcelo Banhos on 16/11/19.
//  Copyright © 2019 Marcelo Banhos. All rights reserved.
//

import UIKit

class GaleriaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var huskyButton: UIButton!
    @IBOutlet weak var houndButton: UIButton!
    @IBOutlet weak var pugButton: UIButton!
    @IBOutlet weak var labradorButton: UIButton!
    
    @IBOutlet weak var fotosCollectionView: UICollectionView!
    private var feedVM = FeedViewModel()
    private var feedListVM = FeedListViewModel()
    var fotoViewController: FotoViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        fotosCollectionView.delegate = self
        fotosCollectionView.dataSource = self
        
        chamaWebServiceCom(categoria: "husky")
        huskyButton.isSelected = true
        
    }
    
    private func chamaWebServiceCom(categoria: String) {
        self.fotosCollectionView.reloadData()
        self.feedListVM = FeedListViewModel()
        feedVM.categoria = categoria
        Webservice().load(resource: Feed.list(vm: feedVM)) { result in
            switch result {
            case .success(let feed):
                
                
                for url in feed.list! {
                    let feedVM = FeedViewModel(categoria: feed.category, url: url)
                    self.feedListVM.adicionaFeedViewModel(feedVM)
                }
                
                self.fotosCollectionView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.feedListVM.numeroDeLinhas()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = fotosCollectionView.dequeueReusableCell(withReuseIdentifier: "CelulaGaleria", for: indexPath) as! FeedCollectionViewCell
        let feedVM = feedListVM.modelNo(indexPath.row)
        cell.configuraCelula(feedVM)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemSelecionado = feedListVM.modelNo(indexPath.row)
        var fotoVM = FotoViewModel()
        fotoVM.url = itemSelecionado.url
        fotoViewController?.fotoVM = fotoVM
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        fotoViewController = segue.destination as? FotoViewController
    }
    
    
    @IBAction func mostraFotos(_ sender: UIButton) {
        guard let categoria = sender.restorationIdentifier else {
            return
        }
        
        huskyButton.isSelected = false
        houndButton.isSelected = false
        pugButton.isSelected = false
        labradorButton.isSelected = false
        
        sender.isSelected = true
        chamaWebServiceCom(categoria: categoria)
    }
    
}
