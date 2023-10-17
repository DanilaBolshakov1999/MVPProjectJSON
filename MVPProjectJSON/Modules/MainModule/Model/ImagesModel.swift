//
//  ModelImages.swift
//  MVPProjectJSON
//
//  Created by iOS - Developer on 15.10.2023.
//

//MARK: - ImagesModel
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
