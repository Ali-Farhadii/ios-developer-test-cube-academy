//
//  NominationsEndpoint.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/21/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct NominationsEndpoint: EndPoint {
    var path: String = "/api/nomination"
    var httpMethod: HTTPMethod = .get
    var httpHeader: [String : String]? = ["Authorization": "Bearer 841|Ga8SqogsfBFibXmxlVpuHXJZLsUl8kqETYtY3t19db2534a8"]
    var httpBody: Encodable?
}
