//
//  C4Slider.swift
//  SwiftAnimation
//
//  Created by Bisma Mahendra I Dewa Gede on 22/06/23.
//

import SwiftUI

struct C4Slider: View {
    @Binding var value: CGFloat
    let label: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            
            HStack {
                Slider(value: $value, in: 0...1, step: 0.1)
                Text("\(value.formatted())")
            }
        }
    }
}

struct C4Slider_Previews: PreviewProvider {
    static var previews: some View {
        C4Slider(value: .constant(1.0), label: "Opa")
    }
}
