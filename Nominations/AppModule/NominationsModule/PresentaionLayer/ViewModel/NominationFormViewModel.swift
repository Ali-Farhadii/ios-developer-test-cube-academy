//
//  NominationFormViewModel.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/29/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

@MainActor
class NominationFormViewModel: ObservableObject {
    
    @Published var nominees: [NomineePresentationModel] = []
    @Published var isError = false
    
    let fairFaces: [FairFace] = FairFace.allCases
    let repository: NominationsRepositoryProtocol
    
    init(repository: NominationsRepositoryProtocol, nominees: [NomineeBusinessModel]) {
        self.repository = repository
        mapNomineesToPresentationModel(nominees)
    }
    
    func createNewNomination(nomineeName: String, reasoning: String, fairFace: FairFace) async -> CreateNominationModel? {
        do {
            isError = false
            let newNominationModel = CreateNewNominationEncodableModel(nomineeId: nomineeName,
                                                                       reason: reasoning,
                                                                       process: fairFace.process)
            return try await repository.createNewNomination(with: newNominationModel)
        } catch {
            isError = true
            return nil
        }
    }
  
    func mapNomineesToPresentationModel(_ nominees: [NomineeBusinessModel]) {
        self.nominees = nominees.map { nominee in
            NomineePresentationModel(nomineeId: nominee.nomineeId,
                                     fullName: "\(nominee.firstName) \(nominee.lastName)")
        }
    }
}
