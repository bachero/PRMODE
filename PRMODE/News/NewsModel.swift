//
//  NewsModel.swift
//  PRMODE
//
//  Created by Javier Bachero Gosalbo on 11/2/23.
//

import Foundation
import Alamofire

struct News: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}

class NewsModel {
    
    func searchData(completion: @escaping (News?) -> Void) {
        let API_KEY = "037ad0c88bec45cd9dac8b66f83e74e3"
        let endpoint = "https://newsapi.org/v2/top-headlines?apiKey=\(API_KEY)&country=us"
            AF.request(endpoint).responseDecodable(of: News.self) { response in
                if let news = response.value {
                    completion(news)
                } else {
                    completion(nil)
                }
            }
    }
}
