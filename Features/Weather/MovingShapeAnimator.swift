//
//  MovingShapeAnimator.swift
//  GhaleTest
//
//  Created by Ali Baqbani on 11/26/24.
//


import SwiftUI

struct MovingShapeAnimator: Animatable, ViewModifier {
    var time : CGFloat
    let path : Path
    let start: CGPoint
    
    var animatableData: CGFloat {
        get { time }
        set { time = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .position(
                path.trimmedPath(from: 0, to: time).currentPoint ?? start
            )
    }
}