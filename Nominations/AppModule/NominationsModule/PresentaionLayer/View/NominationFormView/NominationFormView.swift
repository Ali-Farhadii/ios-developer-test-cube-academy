//
//  NominationFormView.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/21/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct NominationFormView: View {
    
    @EnvironmentObject var navController: NavigationController
    @ObservedObject var viewModel: NominationFormViewModel
    @State private var cubesName = NomineePresentationModel()
    @State private var reasoning = ""
    @State private var isPresentExitView = false
    @State private var selectedFair: FairFace?
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderBarView(title: "Create a nomination")
            
            List {
                Image(.formImageView)
                    .resizable()
                    .scaledToFill()
                    .listRowInsets(.init())
                
                Text("I’d like to nominate...")
                    .textCase(.uppercase)
                    .style(.boldHeadlineSmall)
                
                Text("Please select a cube who you feel has done something honorable this month or just all round has a great work ethic.")
                    .style(.body)
                    .listRowInsets(.init(top: -5, leading: 20, bottom: 18, trailing: 20))
                
                Text("* Cube's name")
                    .style(.boldHeadlineSmall)
                
                Menu {
                    Picker("Cube name", selection: $cubesName) {
                        ForEach(viewModel.nominees, id: \.nomineeId) { nominee in
                            Text(nominee.fullName)
                                .tag(nominee)
                        }
                    }
                } label: {
                    cubesName.nomineeId.isEmpty ? Text("Select Option") : Text(cubesName.fullName)
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                .padding()
                .border(.cubeMidGrey, width: 1)
                .listRowInsets(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                Divider()
                
                Text("I'D like to nominate this cube because ...")
                    .textCase(.uppercase)
                    .style(.boldHeadlineSmall)
                
                Text("Please let us know why you think this cube deserves the ‘cube of the month’ title 🏆⭐")
                    .style(.body)
                    .listRowInsets(.init(top: -5, leading: 20, bottom: 18, trailing: 20))
                
                Text("Reasoning")
                    .textCase(.uppercase)
                    .style(.boldHeadlineSmall)
                
                TextEditor(text: $reasoning)
                    .padding(.horizontal)
                    .style(.body)
                    .frame(height: 140)
                    .border(.cubeMidGrey, width: 1)
                
                Text("IS HOW WE CURRENTLY RUN CUBE OF THE MONTH FAIR?")
                    .textCase(.uppercase)
                    .style(.boldHeadlineSmall)
                
                Text("As you know, out the nominees chosen, we spin a wheel to pick the cube of the month. What’s your opinion on this method?")
                    .style(.body)
                    .listRowInsets(.init(top: -5, leading: 20, bottom: 18, trailing: 20))
                
                ForEach(viewModel.fairFaces, id: \.self) { fairFace in
                    FairView(fairFace: fairFace, 
                             isSelected: fairFace == selectedFair)
                    .onTapGesture {
                        selectedFair = fairFace
                    }
                }
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            
            HStack {
                SecondaryButton(title: "Back") {
                    isPresentExitView = true
                }
                .frame(maxWidth: .infinity)
                
                PrimaryButton(title: "Next") {
                    if let fairFace = selectedFair,
                       !cubesName.nomineeId.isEmpty, !reasoning.isEmpty {
                        Task {
                            async let _ = viewModel.createNewNomination(nomineeName: cubesName.nomineeId,
                                                                        reasoning: reasoning,
                                                                        fairFace: fairFace)
                            navController.navigate(to: NominationsModuleDestinations.submitted)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width / 3 * 2)
            }
            .padding()
            .background(Color.white)
        }
        .sheet(isPresented: $isPresentExitView, content: {
            ExitView {
                navController.popToRootView()
            }
            .presentationDetents([.fraction(0.45)])
        })
    }
    
}

#Preview {
    NominationsDependencyContainer().nominationFormView(nominees: [])
}
