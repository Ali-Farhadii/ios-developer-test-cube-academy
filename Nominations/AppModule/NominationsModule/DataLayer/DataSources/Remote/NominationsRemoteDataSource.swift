//
//  NominationsRemoteDataSource.swift
//  Nominations
//
//  Created by Ali Farhadi on 2/21/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

protocol NominationsRemoteDataSource {
    func fetchNominations() async throws -> [NominationsBusinessModel]
    func fetchNominees() async throws -> [NomineeBusinessModel]
    func createNewNomination(with newNomination: CreateNewNominationEncodableModel) async throws -> CreateNominationModel
}

struct NominationsURLSessionDataSource: NominationsRemoteDataSource {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchNominations() async throws -> [NominationsBusinessModel] {
        mapNominationsToBusinessModel(try await networkService.request(NominationsEndpoint()))
    }
    
    func fetchNominees() async throws -> [NomineeBusinessModel] {
        mapNomineesToBusinessModel(try await networkService.request(NomineeEndpoint()))
    }
    
    func createNewNomination(with newNomination: CreateNewNominationEncodableModel) async throws -> CreateNominationModel {
        let endpoint = CreateNominationEndpoint(newNominationModel: newNomination)
        let createNewNomination: CreateNominationModel = try await networkService.request(endpoint)
        return createNewNomination
    }
    
    private func mapNominationsToBusinessModel(_ nominations: NominationsDecodableModel) -> [NominationsBusinessModel] {
        nominations.data.map { NominationsBusinessModel(nominationId: $0.nominationId, nomineeId: $0.nomineeId,
                                                        reason: $0.reason, process: $0.process,
                                                        dateSubmitted: $0.dateSubmitted,
                                                        closingDate: $0.closingDate) }
    }
    
    private func mapNomineesToBusinessModel(_ nominees: NomineesDecodableModel) -> [NomineeBusinessModel] {
        nominees.data.map { NomineeBusinessModel(nomineeId: $0.nomineeId,
                                                 firstName: $0.firstName,
                                                 lastName: $0.lastName) }
    }
}
