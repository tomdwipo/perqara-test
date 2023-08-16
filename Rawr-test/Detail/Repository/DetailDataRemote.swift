//
//  DetailDataRemote.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import Foundation

protocol DetailDataDelegate {
    func showData(detail: DetailData)
    func dataIsLove(check: Bool)
}

protocol DetailDataRemote {
    func showData(id: String)
    func deleteData(with data: DetailData?)
    func saveData(with data: DetailData?)
    func checkIsDataLove(with id: String)
    var delegate: DetailDataDelegate? { get set }
}

class DetailDataRemoteImpl: DetailDataRemote {
    var delegate: DetailDataDelegate?
    private let network = BaseRemoteData<DetailDataResponse>()
    private let baseLocalData = BaseLocalData<HomeViewData>()

    
    func showData(id: String){
        let urls = "https://api.rawg.io/api/games/\(id)?key=56712c4055aa42d094171803c14b0cf9"
        network.fetchData(urlString: urls) { data in
            if let data = data {
                let detail: DetailData = DetailData(id:data.id ,title: data.name, image: data.background_image, developerName: data.developers.first?.name ?? "", releaseDate: "Release Data \(data.released)", rating: data.rating.description, gamesCount: "\(data.reviews_count.description) played", detail: data.description_raw)
                self.delegate?.showData(detail: detail)
            }
        }
    }
    
    func saveData(with data: DetailData?){
        guard let data = data else { return }
        let homeViewData: HomeViewData = HomeViewData(id: data.id, title: data.title, releaseDate: data.releaseDate, rating: Double(data.rating) ?? 0, image: data.image)
        baseLocalData.saveListData(with: "test", value: homeViewData)
    }
    
    func checkIsDataLove(with id: String){
        let data = baseLocalData.showListData(with: "test")
        let isExist = data.first(where: {$0.id == Int(id)})
        self.delegate?.dataIsLove(check: isExist != nil)
    }
    
    func deleteData(with data: DetailData?){
        guard let data = data else { return }
        let homeViewData: HomeViewData = HomeViewData(id: data.id, title: data.title, releaseDate: data.releaseDate, rating: Double(data.rating) ?? 0, image: data.image)
        baseLocalData.deleteDataFromList(with: "test", value: homeViewData)
    }

}
