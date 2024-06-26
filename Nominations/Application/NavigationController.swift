//
//  NavigationController.swift
//  Nominations
//
//  Created by Ali Farhadi on 3/1/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import SwiftUI

class NavigationController: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func navigate(to destination: any Hashable) {
        path.append(destination)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRootView() {
        path.removeLast(path.count)
    }
}
