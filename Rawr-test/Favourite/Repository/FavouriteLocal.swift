//
//  FavouriteLocal.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import Foundation

protocol FavouriteLocalDelegate {
    func showData(home: [HomeViewData])
}

protocol FavouriteLocal {
    func loadData()
    var delegate: FavouriteLocalDelegate? { get set }
}

class FavouriteLocalImpl: FavouriteLocal {
    var delegate: FavouriteLocalDelegate?
    
    func loadData(){
        let baseLocalData = BaseLocalData<HomeViewData>()
        let data = baseLocalData.showListData(with: "test")
        self.delegate?.showData(home: data)
    }
}

