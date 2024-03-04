//
//  ExitView.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/29/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct ExitView: View {
    
    var mainButtonAction: () -> Void
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Are you sure?")
                .style(.boldHeadlineSmall)
            
            Text("If you leave this page, you will loose any progress made.")
                .lineLimit(2)
                .style(.body)
            
            Spacer()
                .frame(height: 50)
            
            SecondaryButton(title: "Yes leave page") {
                mainButtonAction()
            }
            
            SecondaryButton(title: "Cancel") {
                dismiss()
            }
        }
        .padding()
    }
}

#Preview {
    ExitView {
        print("Exit")
    }
}
