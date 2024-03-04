//
//  NominationsRepository.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/21/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

protocol NominationsRepositoryProtocol {
    func fetchNominations() async throws -> [NominationsBusinessModel]
    func fetchNominees() async throws -> [NomineeBusinessModel]
    func createNewNomination(with newNomination: CreateNewNominationEncodableModel) async throws -> CreateNominationModel
}

class NominationsRepository: NominationsRepositoryProtocol {
    
    let remoteDataSources: NominationsRemoteDataSource
    
    init(remoteDataSources: NominationsRemoteDataSource) {
        self.remoteDataSources = remoteDataSources
    }
    
    func fetchNominations() async throws -> [NominationsBusinessModel] {
        try await remoteDataSources.fetchNominations()
    }
    
    func fetchNominees() async throws -> [NomineeBusinessModel] {
        return try await remoteDataSources.fetchNominees()
    }
    
    func createNewNomination(with newNomination: CreateNewNominationEncodableModel) async throws -> CreateNominationModel {
        try await remoteDataSources.createNewNomination(with: newNomination)
    }
}
