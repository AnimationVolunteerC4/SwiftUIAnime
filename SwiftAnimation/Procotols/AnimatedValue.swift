//
//  AnimatedState.swift
//  SwiftAnimation
//
//  Created by Bisma Mahendra I Dewa Gede on 22/06/23.
//

import SwiftUI

protocol AnimatedValue {
    var before: String { get set }
    var after: String { get set }
    
    var beforeVal: CGFloat { get }
    var afterVal: CGFloat { get }
}
