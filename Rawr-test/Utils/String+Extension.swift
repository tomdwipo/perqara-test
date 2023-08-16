//
//  String+Extension.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import Foundation

extension String {
    func hostApi()-> String {
        var newUrl: String = ""
        if let baseUrl =  Bundle.main.infoDictionary?["BASE_URL"] as? String {
            newUrl = "https://" + baseUrl + self
        }
        return newUrl
    }
    
    static func keyApi()->String {
        var key = ""
        if let keyInfo =  Bundle.main.infoDictionary?["RAW_KEY"] as? String {
            key = keyInfo
        }
        return key
    }
}
