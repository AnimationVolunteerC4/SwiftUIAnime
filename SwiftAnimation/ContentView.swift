//
//  ContentView.swift
//  SwiftAnimation
//
//  Created by Bisma Mahendra I Dewa Gede on 16/06/23.
//

import SwiftUI

struct ContentView: View {
    @State var animated = false
    @State var size = 1.0
    
    var body: some View {
        AnimatableWay()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
