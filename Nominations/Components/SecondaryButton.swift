//
//  SecondaryButton.swift
//  Nominations
//
//  Created by Ali Farhadi on 3/1/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .border(buttonBorderColor(isPressed: configuration.isPressed), width: 2)
            .style(.button)
            .bold()
    }
    
    func buttonBorderColor(isPressed: Bool) -> Color {
        if !isEnabled {
            return .cubeMidGrey
        }
        if isPressed {
            return .accent
        }
        return .black
    }
}

struct SecondaryButton: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .textCase(.uppercase)
        }
        .buttonStyle(SecondaryButtonStyle())
    }
}

#Preview {
    SecondaryButton(title: "Secondary button", action: {})
}
