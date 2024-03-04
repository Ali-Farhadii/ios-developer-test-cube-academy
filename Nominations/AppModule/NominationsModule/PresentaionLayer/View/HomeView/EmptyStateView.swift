//
//  EmptyStateView.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/21/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        Spacer()
        VStack(spacing: 30) {
            Image(systemName: "tray.fill")
                .font(.system(size: 75))
                .foregroundStyle(Color.gray)
            Text("Once you submit a nomination, you will be able to see it here")
                .style(.boldHeadlineMedium)
                .foregroundStyle(Color.gray)
                .textCase(.uppercase)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        Spacer()
    }
}
