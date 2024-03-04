//
//  EndPoint.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/20/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

protocol EndPoint {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var httpHeader: [String: String]? { get }
    var allHeaders: [String: String] { get }
    var httpBody: Encodable? { get }
}

extension EndPoint {
    var allHeaders: [String: String] {
        defaultHeader.merging(httpHeader ?? [:]) { (_, new) in new }
    }
    
    private var defaultHeader: [String: String] {
        [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
    
    func createURLRequest() -> URLRequest? {
        guard let url = URL(string: Constants.baseUrl + path) else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        if let body = httpBody {
            let jsonData = try? encoder.encode(body)
            urlRequest.httpBody = jsonData
        }
        
        allHeaders.forEach {
            urlRequest.addValue($1, forHTTPHeaderField: $0)
        }
        
        return urlRequest
    }
}
