//
//  HomeDataResponse.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import Foundation

struct HomeDataResponse: Codable {
    let results: [HomeDataResults]?
}

struct HomeDataResults: Codable {
    let name: String
    let released: String
    let background_image: String
    let rating: Double
    let id: Int
}
