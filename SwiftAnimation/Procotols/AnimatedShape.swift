//
//  AnimatedShape.swift
//  SwiftAnimation
//
//  Created by Bisma Mahendra I Dewa Gede on 22/06/23.
//

import SwiftUI

protocol AnimatedShape {
    var width: String { get set }
    var height: String { get set }
      
    var widthVal: CGFloat { get }
    var heightVal: CGFloat { get }
    
    var halfWidth: CGFloat { get }
    var halfHeight: CGFloat { get }
}
