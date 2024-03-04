//
//  CreateNewNominationEncodableModel.swift
//  Nominations
//
//  Created by Ali Farhadi on 3/3/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct CreateNewNominationEncodableModel: Encodable {
    var nomineeId: String
    var reason: String
    var process: String
}
