//
//  NominationsDependencyContainer.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/21/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import SwiftUI

enum NominationsModuleDestinations: Hashable {
    case home
    case form(nominees: [NomineeBusinessModel])
    case submitted
}

struct NominationsDependencyContainer {
    
    @MainActor
    var rootView: some View {
        homeView
            .navigationDestination(for: NominationsModuleDestinations.self) { destination in
                switch destination {
                case .home:
                    homeView
                case .form(let nominees):
                    nominationFormView(nominees: nominees)
                case .submitted:
                    submittedView
                }
        }
    }
    
    @MainActor
    var homeView: some View {
        HomeView(viewModel: homeViewModel)
    }
    
    @MainActor
    private var homeViewModel: HomeViewModel {
        HomeViewModel(repository: nominationsRepository)
    }
    
    @MainActor
    func nominationFormView(nominees: [NomineeBusinessModel]) -> some View {
        NominationFormView(viewModel: nominationFormViewModel(nominees: nominees))
            .navigationBarBackButtonHidden()
    }
    
    @MainActor
    private func nominationFormViewModel(nominees: [NomineeBusinessModel]) -> NominationFormViewModel {
        NominationFormViewModel(repository: nominationsRepository, nominees: nominees)
    }
    
    @MainActor
    private var nominationsRepository: NominationsRepositoryProtocol {
        NominationsRepository(remoteDataSources: remoteDataSource)
    }
    
    private var remoteDataSource: NominationsRemoteDataSource {
        NominationsURLSessionDataSource(networkService: URLSessionService())
    }
    
    @MainActor
    var submittedView: some View {
        NominationSubmitted()
            .navigationBarBackButtonHidden()
    }
}
