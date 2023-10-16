//
//  NetworkService.swift
//  MVPProjectJSON
//
//  Created by iOS - Developer on 15.10.2023.
//

import Foundation

//MARK: - NetworkServiceProtocol
protocol NetworkServiceProtocol {
    func getComment(numberLimit: Int, completion: @escaping (Result<[ImagesModel]?, Error>) -> Void)
}

//MARK: - NetworkServiceTable
final class NetworkServiceTable: NetworkServiceProtocol {
    
    //MARK: - Private Propirties
    private let baseURL = "https://"
    private let apiKey = ""
    
    //MARK: - JSONDecoder
    func getComment(numberLimit: Int, completion: @escaping (Result<[ImagesModel]?, Error>) -> Void) {
        let queryString = "?limit=\(numberLimit)&apiKey=\(apiKey)"
        let urlString = baseURL + queryString
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, fetchError in
            if let fetchError = fetchError {
                completion(.failure(fetchError))
                return
            }
            do {
                let decoder = JSONDecoder()
                let task = try decoder.decode([ImagesModel].self, from: data ?? Data())
                print(completion(.success(task)))
                completion(.success(task))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
