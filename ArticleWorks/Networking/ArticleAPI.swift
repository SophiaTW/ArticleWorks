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
    func getAllArticles(query: String, completionHandler: @escaping (ArticlesResponseDTO) -> Void)
}

struct ArticleAPI: ArticleAPIProtocol {
    static let baseURL = "github.com"
    
    func getAllArticles(query: String, completionHandler: @escaping (ArticlesResponseDTO) -> Void) {
        guard let url = buildURL(path: .allArticles) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.get.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  error == nil
            else {
                print("error", error ?? URLError(.badServerResponse))
                return
            }
            
            guard (200...299) ~= response.statusCode else {
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
            
            do {
                let articlesResponseDTO = try JSONDecoder().decode(ArticlesResponseDTO.self, from: data)
                completionHandler(articlesResponseDTO)
            } catch {
                print(error)
                
                if let responseString = String(data: data, encoding: .utf8) {
                    print("responseString = \(responseString)")
                } else {
                    print("unable to parse response as string")
                }
            }
        }
        
        task.resume()
    }
    
    private func buildURL(path: Path) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = ArticleAPI.baseURL
        components.path = path.rawValue

        return components.url
    }
}
