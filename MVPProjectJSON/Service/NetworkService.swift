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

final class NetworkServiceTable: NetworkServiceProtocol {
    
    //MARK: - Private Propirties
    private let baseURL = "https://api.thecatapi.com/v1/images/search"
    private let limitString = "?limit="
    private let apiKeyString = "&api_key="
    private let apiKey = "live_B2ZnG91wVZ2PDfZ0MHM8CfwLMqLO4ThjweHJqrHMBofVMon934k33YUX0dCVzaqw"
    
    //MARK: - JSONDecoder
    func getComment(numberLimit: Int, completion: @escaping (Result<[ImagesModel]?, Error>) -> Void) {
        let urlString = baseURL + limitString + "\(10)" + apiKeyString + apiKey
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
