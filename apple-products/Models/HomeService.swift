//
//  HomeService.swift
//  apple-products
//
//  Created by Guilherme Viana on 07/11/2023.
//

import Foundation

enum ErrorDetail: Swift.Error {
    case errorURL(urlString: String)
    case detailError(detail: String)
}

class HomeService {
    
    func fetchHomeData(completion: @escaping(HomeData?, Error?) -> Void) {
        let urlString: String = "https://run.mocky.io/v3/2d104e92-3805-445c-adcc-97b06e3ab490"
        guard let url: URL = URL(string: urlString) else { return completion(nil, ErrorDetail.errorURL(urlString: urlString)) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let dataResult = data else { return completion(nil, ErrorDetail.detailError(detail: "Couldn't fetch any data from specified URL")) }
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                do {
                    let homeData: HomeData = try JSONDecoder().decode(HomeData.self, from: dataResult)
                    completion(homeData, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
