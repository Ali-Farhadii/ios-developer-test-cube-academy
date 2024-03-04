//
//  NominationCellView.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/21/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import SwiftUI

struct NominationCellView: View {
    
    let nomination: NominationPresentationModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(nomination.name)
                .style(.bodyBold)
            Text(nomination.reason)
                .style(.body)
        }
    }
}
