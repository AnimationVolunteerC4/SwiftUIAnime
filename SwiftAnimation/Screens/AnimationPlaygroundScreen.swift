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
    @State var positionX = AnimatedState(before: "196", after: "196")
    @State var positionY = AnimatedState(before: "125", after: "125")
    @State var scale = AnimatedState(before: "1", after: "1")
    @State var opacity = AnimatedState<CGFloat>(before: 1, after: 1)
    @State var offsetX = AnimatedState(before: "0", after: "0")
    @State var offsetY = AnimatedState(before: "0", after: "0")
    
    var body: some View {
        GeometryReader { geo in
            let frameWidth = geo.size.width
            let frameHeight = geo.size.height * (1/3)
            
            VStack(spacing: 20) {
                HStack {
                    Text("Frame width: **\(frameWidth.formatted())**")
                    Text("Frame width: **\(frameHeight.formatted())**")
                }
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
                                y: animated ? positionY.afterVal : positionY.beforeVal
                            )
                        )
                        .offset(
                            x: animated ? offsetX.afterVal : offsetX.beforeVal,
                            y: animated ? offsetY.afterVal : offsetX.beforeVal
                        )
                        .scaleEffect(animated ? scale.afterVal : scale.beforeVal)
                        .opacity(animated ? opacity.afterVal : opacity.beforeVal)
                        .animation(.linear, value: animated)
                }
                .frame(width: frameWidth, height: frameHeight)
                .background(.blue)
                .clipped()
                
                Section {
                    HStack {
                        C4NumberField(number: $rectangle.width, placeholder: "120", label: "Width")
                        
                        C4NumberField(number: $rectangle.height, placeholder: "120", label: "Height")
                    }
                } header: {
                    Text("Rectangle Size")
                        .fontWeight(.bold)
                }
                .padding(.horizontal)
                
                
                Section {
                    HStack {
                        Text("Before")
                        
                        Spacer()
                        
                        Image(systemName: "arrow.right")
                        
                        Spacer()
                        
                        Text("After")
                    }
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    
                    ScrollView {
                        VStack {
                            HStack {
                                C4NumberField(number: $positionX.before, placeholder: "120", label: "Position X")
                                
                                C4NumberField(number: $positionX.after, placeholder: "120", label: "Position X")
                            }
                            
                            HStack {
                                C4NumberField(number: $positionY.before, placeholder: "120", label: "Position Y")
                                
                                C4NumberField(number: $positionY.after, placeholder: "120", label: "Position Y")
                            }
                            
                            HStack {
                                C4NumberField(number: $offsetX.before, placeholder: "120", label: "Offset X")
                                
                                C4NumberField(number: $offsetX.after, placeholder: "120", label: "Offset X")
                            }
                            
                            HStack {
                                C4NumberField(number: $offsetY.before, placeholder: "120", label: "Offset Y")
                                
                                C4NumberField(number: $offsetY.after, placeholder: "120", label: "Offset Y")
                            }
                            
                            HStack {
                                C4NumberField(number: $scale.before, placeholder: "1", label: "Scale")
                                
                                C4NumberField(number: $scale.after, placeholder: "1.2", label: "Scale")
                            }
                            
                            HStack {
                                C4Slider(value: $opacity.before, label: "Opacity")
                                
                                C4Slider(value: $opacity.after, label: "Opacity")
                            }
                        }
                        .padding(.horizontal)
                    }
                } header: {
                    Text("Modifier Settings")
                        .fontWeight(.bold)
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
    }
}

struct AnimationPlaygroundScreen_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPlaygroundScreen()
    }
}
