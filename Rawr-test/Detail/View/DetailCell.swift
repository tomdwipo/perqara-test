//
//  DetailCell.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionGame: UILabel!
    @IBOutlet weak var gamesCount: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    
    func setupData(data: DetailData?) {
        guard let data = data else { return }
        genreLabel.text = data.developerName
        titleLabel.text = data.title
        descriptionGame.text = data.detail
        gamesCount.text = data.gamesCount
        rating.text = data.rating
        releaseDate.text = data.releaseDate
        self.setImageFromStringrURL(stringUrl: data.image) {[weak self] image in
            self?.posterImage.image = UIImage(data: image)
        }
    }
    
}
