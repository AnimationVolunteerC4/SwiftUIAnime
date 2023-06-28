//
//  UseCaseListScreen.swift
//  SwiftAnimation
//
//  Created by Bisma Mahendra I Dewa Gede on 28/06/23.
//

import SwiftUI

struct UseCaseListScreen: View {
    @EnvironmentObject private var useCaseNavigation: UseCaseNavigationManager
    
    var body: some View {
        VStack {
            C4Toolbar(title: "Use Case")
            
            
            ScrollView {
                VStack(spacing: 12) {
                    C4UseCaseItem(label: "Chart One") {
                        useCaseNavigation.push(to: .useCaseOne)
                    }
                    
                    C4UseCaseItem(label: "Chart Two") {
                        useCaseNavigation.push(to: .useCaseTwo)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
            }
            
            Spacer()
        }
    }
}

struct UseCaseListScreen_Previews: PreviewProvider {
    static var previews: some View {
        UseCaseListScreen()
    }
}
