//
//  UseCaseRoutes.swift
//  SwiftAnimation
//
//  Created by Bisma Mahendra I Dewa Gede on 27/06/23.
//

import Combine
import SwiftUI

enum UseCaseRoute: Hashable {
    case useCaseOne
    case useCaseTwo
}

class UseCaseNavigationManager: ObservableObject{
    
    @Published var paths = NavigationPath()
    
    func push(to route: UseCaseRoute) {
        paths.append(route)
    }
    
    func goBack()  {
        paths.removeLast()
    }
    
    func reset() {
        paths = NavigationPath()
    }
}
