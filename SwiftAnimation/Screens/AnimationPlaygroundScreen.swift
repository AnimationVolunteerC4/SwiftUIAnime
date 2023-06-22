//
//  AnimationPlaygroundScreen.swift
//  SwiftAnimation
//
//  Created by Bisma Mahendra I Dewa Gede on 22/06/23.
//

import SwiftUI

struct AnimationPlaygroundScreen: View {
    @State var animated = false
    @State var rectangle = RectangleState()
    @State var positionX = AnimatedState()
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 20) {
                AnimationDisplayView {
                    Rectangle()
                        .fill(.black)
                        .frame(
                            width: rectangle.widthVal,
                            height: rectangle.heightVal
                        )
                        .position(
                            CGPoint(
                                x: animated ? positionX.afterVal : positionX.beforeVal,
                                y: rectangle.halfHeight
                            )
                        )
                        .animation(.linear, value: animated)
                }
                .frame(width: geo.size.width, height: geo.size.height * (1/2))
                .background(.blue)
                
                VStack {
                    
                }
                
                HStack {
                    Text("Before")
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                    
                    Spacer()
                    
                    Text("After")
                }
                .fontWeight(.bold)
                .padding(.horizontal)
                
                HStack {
                    VStack {
                        C4NumberField(number: $positionX.before, placeholder: "120", label: "Position X")
                    }
                    .padding(.horizontal)
                    
                    VStack {
                        C4NumberField(number: $positionX.after, placeholder: "120", label: "Position X")
                    }
                    .padding(.horizontal)
                }
                
                Button {
                    animated.toggle()
                } label: {
                    Text(animated ? "Revert" : "Animate")
                }
                .buttonStyle(
                    .borderedProminent
                )

//
//                ModifierSettingsView()
//                    .frame(width: geo.size.width,height: geo.size.height * (1/4))
//                    .background(.yellow)
//
//                TimeAlgoSettingsView()
//                    .frame(width: geo.size.width,height: geo.size.height * (1/4))
//                    .background(.green)
            }
        }
//        .background(.red)
    }
}

struct AnimationPlaygroundScreen_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPlaygroundScreen()
    }
}
