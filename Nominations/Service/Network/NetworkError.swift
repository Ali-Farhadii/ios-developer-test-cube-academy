//
//  NetworkError.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/20/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

enum NetworkError: String, Error {
    case badRequest = "Bad request"
    case invalidResponse = "Invalid response"
    case decodeFailed = "Decode failed"
}
