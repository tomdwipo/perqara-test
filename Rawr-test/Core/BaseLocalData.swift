//
//  BaseLocalData.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import Foundation

class BaseLocalData<T: Codable & Comparable> {
    func saveListData(with key: String, value: T){
        var data: [T] = []
        if let object = UserDefaults.standard.object(forKey: key) as? Data,
           let decodeObject = try? JSONDecoder().decode([T].self, from: object) {
            data = decodeObject
        }
        data.append(value)
        if let encodedData = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }
    
    func showListData(with key: String) -> [T] {
        var data: [T] = []
        if let object = UserDefaults.standard.object(forKey: key) as? Data,
           let decodeObject = try? JSONDecoder().decode([T].self, from: object) {
            data = decodeObject
        }
        return data
    }
    
    func deleteDataFromList(with key: String, value: T) {
        var data: [T] = []
        if let object = UserDefaults.standard.object(forKey: key) as? Data,
           let decodeObject = try? JSONDecoder().decode([T].self, from: object) {
            data = decodeObject
        }
        
        var newData: [T] = []
        for item in data {
            if (item != value) {
                newData.append(item)
            }
        }
        if let encodedData = try? JSONEncoder().encode(newData) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }
}
