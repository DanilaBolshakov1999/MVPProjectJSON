//
//  Singleton.swift
//  MVPProjectJSON
//
//  Created by iOS - Developer on 17.10.2023.
//

import Foundation

class ModelSingleton: NSObject {
    
    static let shared = ModelSingleton() //Доступ к значению до иницилизации
    
    public var data = [String]()
    
    
    struct ImagesModel: Decodable {
        let id: String
        let url: String
        let width: Int
        let height: Int
    }

    struct Breeds: Decodable {
        let weight: Weight
        let id: String
        let name: String
        let temperament: String
        let origin: String
        let country_codes: String
        let country_code: String
    }

    struct Weight: Decodable {
        let imperial: String
        let metric: String
    }
    
    func removeData(id: String) {
        data = data.filter { $0 != id }
    }
}
