//
//  AnimatedValue+Extension.swift
//  SwiftAnimation
//
//  Created by Bisma Mahendra I Dewa Gede on 22/06/23.
//

import Foundation

extension AnimatedValue {
    var beforeVal: CGFloat {
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
