//
//  HomeRemote.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import UIKit

protocol HomeRemoteDelegate {
    func showData(home: [HomeViewData])
}
protocol HomeRemote {
    func search(query: String)
    var delegate: HomeRemoteDelegate? { get set }
}


class HomeRemoteImpl: HomeRemote {
    var delegate: HomeRemoteDelegate?
    private let remoteData = BaseRemoteData<HomeDataResponse>()
    
    func search(query: String){
        let urlString = "https://api.rawg.io/api/games?key=56712c4055aa42d094171803c14b0cf9&pages=1&page_size=20&search=\(query)"
        remoteData.fetchData(urlString: urlString) { data in
            var homeData: [HomeViewData] = []
            if let result = data?.results {
                for item in result {
                    homeData.append(HomeViewData(id:item.id ,title: item.name, releaseDate: "Release date \(item.released)" , rating: item.rating, image: item.background_image))
                }
                self.delegate?.showData(home: homeData)
            }
        }
    }
}


