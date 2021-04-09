//
//  RestApi.swift
//  ReactiveSwiftConquer
//
//  Created by The App Experts on 09/04/2021.
//

import Foundation

//https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en

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
    
    func fetch(from url:URL) {
        
    }
}
