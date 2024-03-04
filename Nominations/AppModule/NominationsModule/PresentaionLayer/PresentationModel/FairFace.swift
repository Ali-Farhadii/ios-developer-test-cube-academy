//
//  FairFace.swift
//  Nominations
//
//  Created by Ali Farhadi on 3/4/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

enum FairFace: CaseIterable {
    case veryUnfair
    case unfair
    case notSure
    case fair
    case veryFair
    
    var imageName: String {
        switch self {
        case .veryUnfair:
            "veryUnfair"
        case .unfair:
            "unfair"
        case .notSure:
            "notSure"
        case .fair:
            "fair"
        case .veryFair:
            "veryFair"
        }
    }
    
    var title: String {
        switch self {
        case .veryUnfair:
            "Very Unfair"
        case .unfair:
            "Unfair"
        case .notSure:
            "Not Sure"
        case .fair:
            "Fair"
        case .veryFair:
            "Very Fair"
        }
    }
    
    var process: String {
        switch self {
        case .veryUnfair:
            "very_unfair"
        case .unfair:
            "unfair"
        case .notSure:
            "not_sure"
        case .fair:
            "fair"
        case .veryFair:
            "very_fair"
        }
    }
}
