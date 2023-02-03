//
//  ArticleAPI.swift
//  ArticleWorks
//
//  Created by Sophia Paulette Muñoz Pailamilla on 03-02-23.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
}

enum Path: String {
    case allArticles = "kodecocodes/ios-interview/blob/master/Practical%20Example/articles.json"
}

protocol ArticleAPIProtocol {
    func getAllArticles(query: String, completionHandler: @escaping () -> Void)
}

struct ArticleAPI: ArticleAPIProtocol {
    static let baseURL = "github.com"
    func getAllArticles(query: String, completionHandler: @escaping () -> Void) {
        guard let url = buildURL(path: .allArticles) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.get.rawValue
    }
    
    private func buildURL(path: Path) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = ArticleAPI.baseURL
        components.path = path.rawValue

        return components.url
    }
}
