//
//  NominationsApp.swift
//  Nominations
//
//  Created by Sam Davis on 20/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

@main
struct NominationsApp: App {
    
    let appDependencyContainer = AppDependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            appDependencyContainer.nominationsDependencyContainer.homeView
        }
    }
}
