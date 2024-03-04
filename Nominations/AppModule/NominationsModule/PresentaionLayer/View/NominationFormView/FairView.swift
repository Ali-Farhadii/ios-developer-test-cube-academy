//
//  FairView.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/29/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct FairView: View {
    
    var fairFace: FairFace
    var isSelected: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Image(fairFace.imageName)
            
            Text(fairFace.title)
                .style(.boldHeadlineSmallest)
            Spacer()
            
            Image(isSelected ? "selected" : "notSelected")
        }
        .padding()
        .border(.cubeMidGrey, width: 1)
    }
}

#Preview {
    FairView(fairFace: .fair, isSelected: false)
}
