//
//  NominationsDecodableModel.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/21/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct NominationsDecodableModel: Decodable {
    var data: [NominationsModel]
}

struct CreateNominationModel: Decodable, Hashable {
    var data: NominationsModel
}

struct NominationsModel: Decodable, Hashable {
    var nominationId: String
    var nomineeId: String
    var reason: String
    var process: String
    var dateSubmitted: String
    var closingDate: String
}
