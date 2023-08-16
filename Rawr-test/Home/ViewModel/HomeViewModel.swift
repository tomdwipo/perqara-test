//
//  HomeViewModel.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import Foundation

struct HomeViewData: Codable, Comparable {
    let id: Int
    let title: String
    let releaseDate: String
    let rating: Double
    let image: String
    
    static func < (lhs: HomeViewData, rhs: HomeViewData) -> Bool {
        return lhs.id.description == rhs.id.description
    }
    
}

protocol HomeViewDelegate {
    func refresh()
}

protocol HomeViewModel {
    func search(query: String)
    var data: [HomeViewData] { get set }
    var delegate: HomeViewDelegate? { get set }
}

class HomeViewModelImpl: HomeViewModel {
    var data: [HomeViewData] = []
    var homeRepo: HomeRemote
    var delegate: HomeViewDelegate?
    
    init(homeRepo: HomeRemote = HomeRemoteImpl()) {
        self.homeRepo = homeRepo
        self.homeRepo.delegate = self
    }
    
    func search(query: String){
        homeRepo.search(query: query)
    }
}

extension HomeViewModelImpl: HomeRemoteDelegate {
    func showData(home: [HomeViewData]) {
        self.data = home
        self.delegate?.refresh()
    }
}
