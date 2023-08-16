//
//  BaseRemoteData.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import UIKit

class BaseRemoteData<T:Codable> {
    func fetchData(urlString: String, results:@escaping(_ T:T?)->Void){
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            if let http = urlResponse as? HTTPURLResponse {
                if http.statusCode == 200 {
                    let data = try? JSONDecoder().decode(T.self, from: data ?? Data())
                    DispatchQueue.main.async {
                        results(data)
                    }
                }
            }
        }.resume()
    }
}
