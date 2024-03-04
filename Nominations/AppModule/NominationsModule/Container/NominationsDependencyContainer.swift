//
//  NominationsDependencyContainer.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/21/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import SwiftUI

struct NominationsDependencyContainer {
    
    @MainActor
    var homeView: some View {
        HomeView(viewModel: homeViewModel,
                 nominationFormViewFactory: nominationFormView)
    }
    
    @MainActor
    private var homeViewModel: HomeViewModel {
        HomeViewModel(repository: nominationsRepository,
                      navController: NavigationController())
    }
    
    @MainActor
    func nominationFormView(nominees: [NomineeBusinessModel]) -> NominationFormView {
        NominationFormView(viewModel: nominationFormViewModel(nominees: nominees))
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
}
