//
//  NominationSubmitted.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/29/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct NominationSubmitted: View {
    
    @EnvironmentObject var navController: NavigationController
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderBarView(title: "Create a nomination")
            
            Image(.folks)
                .resizable()
                .scaledToFit()
            
            Spacer()
                .frame(height: 30)
            
            Text("Nomination Submitted")
                .textCase(.uppercase)
                .style(.boldHeadlineLarge)
                .multilineTextAlignment(.center)
            
            Spacer()
                .frame(height: 15)
            
            Text("Thank you for taking the time to fill out this form! Why not nominate another cube?")
                .style(.body)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            PrimaryButton(title: "Create new nomination") {
                navController.pop()
            }
            .padding(.horizontal)
            
            SecondaryButton(title: "Back to home") {
                navController.popToRootView()
            }
            .padding()
        }
    }
}

#Preview {
    NominationSubmitted()
        .environmentObject(NavigationController())
}
