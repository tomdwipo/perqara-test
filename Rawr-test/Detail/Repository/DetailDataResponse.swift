//
//  DetailDataResponse.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import Foundation

struct DetailDataResponse: Codable {
    let id: Int
    let name: String
    let description_raw: String
    let released: String
    let background_image: String
    let rating: Double
    let reviews_count: Int
    let developers: [DetailDataDevelopers]
    
}

struct DetailDataDevelopers: Codable {
    let name: String
}
