//
//  Animation+Extension.swift
//  SwiftAnimation
//
//  Created by Bisma Mahendra I Dewa Gede on 23/06/23.
//

import SwiftUI

enum TimeAlgo {
    case linear, easeIn, easeOut, easeInOut, spring
}

struct GeneralConfiguration: AnimationConfiguration {
    var duration: String
    
    var response: String
    
    var dampingFraction: String
      
    var speed: String
    
    var delay: String
    
    var repeatCount: String
    
    var repeatForever: Bool
}

extension Animation {
    static func getAnimation(timeAlgo: TimeAlgo, configuration: GeneralConfiguration) -> Animation {
        if configuration.repeatForeverVal {
            switch timeAlgo {
            case .linear:
                return Animation
                    .linear(duration: configuration.durationVal)
                    .delay(configuration.delayVal)
                    .speed(configuration.speedVal)
                    .repeatForever()
                
            case .easeIn:
                return Animation
                    .easeIn(duration: configuration.durationVal)
                    .delay(configuration.delayVal)
                    .speed(configuration.speedVal)
                    .repeatForever()
                
            case .easeOut:
                return Animation
                    .easeOut(duration: configuration.durationVal)
                    .delay(configuration.delayVal)
                    .speed(configuration.speedVal)
                    .repeatForever()
                
            case .easeInOut:
                return Animation
                    .easeInOut(duration: configuration.durationVal)
                    .delay(configuration.delayVal)
                    .speed(configuration.speedVal)
                    .repeatForever()
                
            case .spring:
                return Animation
                    .spring(response: configuration.responseVal, dampingFraction: configuration.dampingFractionVal)
                    .delay(configuration.delayVal)
                    .speed(configuration.speedVal)
                    .repeatForever()
            }
        } else {
            switch timeAlgo {
            case .linear:
                return Animation
                    .linear(duration: configuration.durationVal)
                    .delay(configuration.delayVal)
                    .speed(configuration.speedVal)
                    .repeatCount(configuration.repeatCountVal)
                
            case .easeIn:
                return Animation
                    .easeIn(duration: configuration.durationVal)
                    .delay(configuration.delayVal)
                    .speed(configuration.speedVal)
                    .repeatCount(configuration.repeatCountVal)
                
            case .easeOut:
                return Animation
                    .easeOut(duration: configuration.durationVal)
                    .delay(configuration.delayVal)
                    .speed(configuration.speedVal)
                    .repeatCount(configuration.repeatCountVal)
                
            case .easeInOut:
                return Animation
                    .easeInOut(duration: configuration.durationVal)
                    .delay(configuration.delayVal)
                    .speed(configuration.speedVal)
                    .repeatCount(configuration.repeatCountVal)
                
            case .spring:
                return Animation
                    .spring(response: configuration.responseVal, dampingFraction: configuration.dampingFractionVal)
                    .delay(configuration.delayVal)
                    .speed(configuration.speedVal)
                    .repeatCount(configuration.repeatCountVal)
            }
        }
    }
}
