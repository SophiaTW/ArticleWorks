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
//https://raw.githubusercontent.com/kodecocodes/ios-interview/master/Practical%20Example/articles.json
enum Path: String {
    case allArticles = "/kodecocodes/ios-interview/master/Practical Example/articles.json"
}

protocol ArticleAPIProtocol {
    func getAllArticles(query: String, completionHandler: @escaping ([Article]) -> Void)
}

struct ArticleAPI: ArticleAPIProtocol {
    static let baseURL = "raw.githubusercontent.com"
    
    func getAllArticles(query: String, completionHandler: @escaping ([Article]) -> Void) {
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
                let articles = mapDTOToArticle(articlesResponseDTO: articlesResponseDTO)
                completionHandler(articles)
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

    func mapDTOToArticle(articlesResponseDTO: ArticlesResponseDTO) -> [Article] {
        articlesResponseDTO.data.map { article in
            let domain = articlesResponseDTO.included.first { included in
                return included.id == article.relationships.domains.data.first?.id
            }
            let createdDate = parseStringToDate(dateString: article.attributes.released_at)
            let duration = parseMinutesToString(duration: article.attributes.duration)
            let difficulty = article.attributes.difficulty?.capitalized ?? ""
            return Article(title: article.attributes.name, domain: domain?.attributes.name ?? "", description: article.attributes.description, createdDate: createdDate, difficulty: difficulty, duration: duration, technology: article.attributes.technology_triple_string, contributor: article.attributes.contributor_string, image: article.attributes.card_artwork_url)
        }
    }
    
    private func buildURL(path: Path) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = ArticleAPI.baseURL
        components.path = path.rawValue

        return components.url
    }
    
    func parseStringToDate (dateString: String) -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate, .withFullTime, .withFractionalSeconds]
        guard let date = formatter.date(from: dateString) else {return ""}

        var dateText = date.formatted(.dateTime.month().day().year())
        let dot = dateText.index(dateText.startIndex, offsetBy: 3)
        let comma = dateText.index(dateText.startIndex, offsetBy: 6)
        dateText.remove(at: dot)
        dateText.remove(at: comma)
        return String(dateText).capitalized
    }
    
    func parseMinutesToString(duration: Int) -> String {
        let hour = duration/60
        let minutes = duration%60
        
        var hourString = hour != 0 ?"\(hour) hr" : ""
        hourString = hour > 1 ? "\(hourString)s" : hourString
        let minutesString = minutes != 0 ? "\(minutes) mins" : ""
        let comma = hourString != "" && minutesString != "" ? ", " : ""

        return hourString + comma + minutesString
    }
}
