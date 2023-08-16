//
//  FavouriteViewModel.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import Foundation

protocol FavouriteViewModelDelegate {
    func refreshData()
}

protocol FavouriteViewModel {
    func loadData()
    var data: [HomeViewData] { get set }
    var delegate: FavouriteViewModelDelegate? { get set }
}

class FavouriteViewModelImpl: FavouriteViewModel {
    var delegate: FavouriteViewModelDelegate?
    var data: [HomeViewData] = []
    private var repo: FavouriteLocal = FavouriteLocalImpl()
    
    init() {
        self.repo.delegate = self
    }
    
    func loadData() {
        self.repo.loadData()
    }
}

extension FavouriteViewModelImpl: FavouriteLocalDelegate {
    func showData(home: [HomeViewData]) {
        self.data = home
        self.delegate?.refreshData()
    }
    
    
}
