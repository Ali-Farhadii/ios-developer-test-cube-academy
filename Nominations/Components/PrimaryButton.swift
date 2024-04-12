//
//  PrimaryButton.swift
//  Nominations
//
//  Created by Ali Farhadi on 3/1/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(buttonBackgroundColor(isPressed: configuration.isPressed))
            .style(.button)
            .bold()
    }
    
    func buttonBackgroundColor(isPressed: Bool) -> Color {
        if !isEnabled {
            return .cubeMidGrey
        }
        if isPressed {
            return .cubeDarkGrey
        }
        return .black
    }
}

struct PrimaryButton: View {
    
    var title: String
    var isLoading = false
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            } else {
                Text(title)
                    .textCase(.uppercase)
            }
        }
        .buttonStyle(PrimaryButtonStyle())
        .disabled(isLoading)
    }
}

#Preview {
    PrimaryButton(title: "Primary button", action: {})
}
