//
//  AnimationPlaygroundScreen.swift
//  SwiftAnimation
//
//  Created by Bisma Mahendra I Dewa Gede on 22/06/23.
//

import SwiftUI

struct RectangleSize {
    static let width: CGFloat = 60
    static var halfWidth: CGFloat {
        width / 2
    }
    
    static let height: CGFloat = 60
    static var halfHeight: CGFloat {
        height / 2
    }
}

struct AnimatedState {
    var before: String
    var after: String
    
    var beforeVal:CGFloat {
        if let n = NumberFormatter().number(from: before) {
            return CGFloat(truncating: n)
        }
        
        return CGFloat(0)
    }
    var afterVal:CGFloat {
        if let n = NumberFormatter().number(from: after) {
            return CGFloat(truncating: n)
        }
        
        return CGFloat(0)
    }
}

struct AnimationPlaygroundScreen: View {
    @State var animated = false
    @State var position = AnimatedState(before: "0", after: "100")
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 20) {
                AnimationDisplayView {
                    Rectangle()
                        .fill(.black)
                        .frame(
                            width: RectangleSize.width,
                            height: RectangleSize.height
                        )
                        .position(
                            CGPoint(
                                x: animated ? position.afterVal : position.beforeVal,
                                y: RectangleSize.halfHeight
                            )
                        )
                        .animation(.linear, value: animated)
                }
                .frame(width: geo.size.width, height: geo.size.height * (1/2))
                .background(.blue)
                
                VStack {
                    C4NumberField(number: $position.before, placeholder: "120", label: "Position Before")
                    
                    C4NumberField(number: $position.after, placeholder: "120", label: "Position After")
                }
                .padding(.horizontal)
                
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
