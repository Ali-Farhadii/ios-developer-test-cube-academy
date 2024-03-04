//
//  NomineesDecodableModel.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/21/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct NomineesDecodableModel: Decodable {
    var data: [Nominee]
}

struct Nominee: Decodable {
    var nomineeId: String
    var firstName: String
    var lastName: String
}
