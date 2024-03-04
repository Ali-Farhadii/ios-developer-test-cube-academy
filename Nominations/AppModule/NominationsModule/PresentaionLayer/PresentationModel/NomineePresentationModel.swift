//
//  NomineePresentationModel.swift
//  Nominations
//
//  Created by Ali Farhadi on 3/3/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct NomineePresentationModel: Hashable {
    var nomineeId: String
    var fullName: String
    
    init(nomineeId: String = "", fullName: String = "") {
        self.nomineeId = nomineeId
        self.fullName = fullName
    }
}
