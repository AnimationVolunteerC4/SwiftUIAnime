//
//  WithoutTransition.swift
//  SwiftAnimation
//
//  Created by Bisma Mahendra I Dewa Gede on 19/06/23.
//

import SwiftUI

struct WithoutTransition: View {
    @State var show = true
    
    var body: some View {
        VStack {
            Spacer()
            Text("Hello")
            if show {
                Text("World")
                    .transition(.slide) // animatable view (wrapped in)
            }
            Spacer()
            Button(show ? "Hide" : "Show") {
                show.toggle()
            }
        }
//        .animation(.linear(duration:3), value: show) // create dependency association, set timing curve function
        .frame(height: 300)
    }
}

struct WithoutTransition_Previews: PreviewProvider {
    static var previews: some View {
        WithoutTransition()
    }
}
