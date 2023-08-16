//
//  CardCell.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import UIKit

class CardCell: UITableViewCell {
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    func setupData(movie: HomeViewData) {
        titleMovie.text = movie.title
        releaseDate.text = movie.releaseDate
        rating.text = movie.rating.description
        setImageFromStringrURL(stringUrl: movie.image) {[weak self] image in
            self?.posterImage.image = UIImage(data: image)
        }
    }
}
