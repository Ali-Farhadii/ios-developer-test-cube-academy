//
//  NetworkService.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/20/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

protocol NetworkService {
    func request<T: Decodable>(_ endPoint: any EndPoint) async throws -> T
}
