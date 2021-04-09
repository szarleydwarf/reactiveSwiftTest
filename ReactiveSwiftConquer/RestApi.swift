//
//  RestApi.swift
//  ReactiveSwiftConquer
//
//  Created by The App Experts on 09/04/2021.
//

import Combine
import Foundation

//https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en

enum NetworkErrors: Error {
    case badURL
    case noData
    case couldNotDecode
}

protocol RApiProtocol {
    func getURL() -> URL?
    func fetch(from url:URL)
}

class RestApi {
    func getURL() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.forismatic.com"
        components.path = "/api/1.0/"
        var queryItems:[URLQueryItem]=[]
        queryItems.append(URLQueryItem(name: "method", value: "getQuote"))
        queryItems.append(URLQueryItem(name: "format", value: "json"))
        queryItems.append(URLQueryItem(name: "lang", value: "en"))
        components.queryItems = queryItems
        return components.url
    }
    
    func fetch(from url:URL?) -> Future<AQuote, NetworkErrors> {
        
        return Future<AQuote, NetworkErrors> {promise in
            guard let url = url else {return promise(.failure(.badURL)) }
            
            URLSession.shared.dataTask(with: url) { data, respons, error in
                guard let fetched = data else {return promise(.failure(.noData))}
                
                let decoder = JSONDecoder()
                guard let model = try? decoder.decode(AQuote.self, from: fetched) else { return promise(.failure(.couldNotDecode))}
                
                return promise(.success(model))
            }
            
        }
    }
}
