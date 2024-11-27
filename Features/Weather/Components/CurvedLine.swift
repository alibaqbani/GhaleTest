//
//  CurvedLine.swift
//  GhaleTest
//
//  Created by Ali Baqbani on 11/26/24.
//


import SwiftUI

struct CurvedLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        
        let startPoint = CGPoint(x: 0, y: 0)
        let midPoint = CGPoint(x: width / 2, y: -60)
        let endPoint = CGPoint(x: width, y: 0)
        
        let controlPoint1 = CGPoint(x: width / 6, y: 0)
        let controlPoint2 = CGPoint(x: width / 3, y: -60)
        
        let controlPoint3 = CGPoint(x: width * 2 / 3, y: -60)
        let controlPoint4 = CGPoint(x: width * 5 / 6, y: 0)
        
        path.move(to: startPoint)
        
        path.addCurve(to: midPoint,
                      control1: controlPoint1,
                      control2: controlPoint2)
        
        path.addCurve(to: endPoint,
                      control1: controlPoint3,
                      control2: controlPoint4)
        
        return path
    }
}
