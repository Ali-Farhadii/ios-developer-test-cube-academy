//
//  HomeViewModel.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/21/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var nominations: [NominationPresentationModel] = [NominationPresentationModel]()
    @Published var navController: NavigationController
    
    var nominees: [NomineeBusinessModel] = []
    private let repository: NominationsRepositoryProtocol
    
    init(repository: NominationsRepositoryProtocol, navController: NavigationController) {
        self.repository = repository
        self.navController = navController
    }
    
    func fetchNominations() async {
        isLoading = true
        do {
            let nominationsList = try await repository.fetchNominations()
            nominees = try await repository.fetchNominees()
            nominations = mapNominationsToPresentationModel(nominations: nominationsList)
            isLoading = false
        } catch {
            print(error)
        }
    }
    
    func mapNominationsToPresentationModel(nominations: [NominationsBusinessModel]) -> [NominationPresentationModel] {
        nominations.compactMap { nomination in
            if let nominee = nominees.first(where: { nominee in
                nomination.nomineeId == nominee.nomineeId
            }) {
                let fullName = "\(nominee.firstName) \(nominee.lastName)"
                return NominationPresentationModel(name: fullName,
                                                   reason: nomination.reason)
            } else {
                return nil
            }
        }
    }
}
