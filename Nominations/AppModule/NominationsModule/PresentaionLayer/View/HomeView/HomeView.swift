//
//  HomeView.swift
//  Nominations
//
//  Created by Sam Davis on 20/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

struct HomeView: View {
    
    @StateObject var navController = NavigationController()
    @ObservedObject var viewModel: HomeViewModel
    let nominationFormViewFactory: (_ nominees: [NomineeBusinessModel]) -> NominationFormView
    
    var body: some View {
        NavigationStack(path: $navController.path) {
            VStack(spacing: 0) {
                HeaderBarView()
                NominationsHeaderView()
                
                if viewModel.isLoading {
                    Spacer()
                    ProgressView()
                    Spacer()
                } else if viewModel.nominations.isEmpty {
                    EmptyStateView()
                } else {
                    List(viewModel.nominations, id: \.id) { nomination in
                        NominationCellView(nomination: nomination)
                    }
                    .listStyle(.plain)
                }
                
                PrimaryButton(title: "Create new nomination",
                              isLoading: viewModel.isLoading) {
                    navController.navigate(with: viewModel.nominees)
                }
                              .padding(.horizontal)
            }
            .navigationDestination(for: [NomineeBusinessModel].self) { nominees in
                nominationFormViewFactory(nominees)
                    .navigationBarBackButtonHidden()
                    .environmentObject(navController)
            }
        }
        .background(.cubeLightGrey)
        .task {
            await viewModel.fetchNominations()
        }
    }
    
}

#Preview {
    NominationsDependencyContainer().homeView
}
