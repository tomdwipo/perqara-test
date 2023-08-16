//
//  DetailViewModel.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import Foundation

struct DetailData {
    var id: Int
    var title: String
    var image: String
    var developerName: String
    var releaseDate: String
    var rating: String
    var gamesCount: String
    var detail: String
}

protocol DetailViewDelegate {
    func refresh()
}

protocol DetailViewModel {
    func loadData(id: String)
    func loveDetail(with data: DetailData?)
    func deleteLoved(with data: DetailData?)
    var detail: DetailData? { get set }
    var isLoved: Bool { get set }
    var delegate: DetailViewDelegate? { get set }
}

class DetailViewModelImpl: DetailViewModel {
    var isLoved: Bool = false
    var detail: DetailData?
    var delegate: DetailViewDelegate?
    private var repo: DetailDataRemote = DetailDataRemoteImpl()
    
    init(){
        self.repo.delegate = self
    }
    
    func loveDetail(with data: DetailData?){
        self.repo.saveData(with: data)
        self.repo.checkIsDataLove(with: data?.id.description ?? "")
    }
    
    func loadData(id: String){
        self.repo.showData(id: id)
        self.checkIsLoveData(id: id)
    }
    
    func deleteLoved(with data: DetailData?){
        self.repo.deleteData(with: data)
        self.repo.checkIsDataLove(with: data?.id.description ?? "")
    }
    
    private func checkIsLoveData(id: String){
        self.repo.checkIsDataLove(with: id)
    }
}

extension DetailViewModelImpl: DetailDataDelegate {
    func dataIsLove(check: Bool) {
        self.isLoved = check
        self.delegate?.refresh()
    }
    
    func showData(detail: DetailData) {
        self.detail = detail
        self.delegate?.refresh()
    }
}
