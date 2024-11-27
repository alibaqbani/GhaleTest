//
//  ContentView.swift
//  GhaleTest
//
//  Created by Ali Baqbani on 11/25/24.
//

import SwiftUI

struct WeatherView: View {
    @State private var progress: CGFloat = 0
    @State private var isAnimating = false

    // Colors
    private var dottedLineColor: Color { Color("DottedLineColor") }
    private var solidLineColor: Color { Color("SolidLineColor") }

    // Styles
    private var dottedStyle: StrokeStyle {
        StrokeStyle(
            lineWidth: 1,
            lineCap: .round,
            lineJoin: .round,
            dash: [2, 4]
        )
    }

    private var solidStyle: StrokeStyle {
        StrokeStyle(
            lineWidth: 3,
            lineCap: .round,
            lineJoin: .round
        )
    }

    // Shapes
    private var curvedLine: CurvedLine { CurvedLine() }

    private var dottedCurvedLine: some View {
        curvedLine
            .stroke(style: dottedStyle)
            .foregroundColor(.gray)
    }

    private var solidCurvedLine: some View {
        curvedLine
            .trim(from: 0, to: progress)
            .stroke(style: solidStyle)
            .foregroundColor(.purple)
    }

    private var sunImage: some View {
        Image(systemName: "sun.max.fill")
            .foregroundStyle(.yellow)
            .font(.system(size: 24))
            .symbolEffect(.bounce.up, options: .repeat(.periodic(delay: 1.0)))
    }

    var body: some View {
        VStack {
            ZStack {
                dottedCurvedLine
                solidCurvedLine

                GeometryReader { geometry in
                    let path = curvedLine.path(in: geometry.frame(in: .local))
                    let animator = MovingShapeAnimator(
                        time: progress,
                        path: path,
                        start: path.trimmedPath(from: 0, to: .leastNonzeroMagnitude).currentPoint ?? .zero
                    )
                    sunImage.modifier(animator)
                }
            }
            .frame(height: 24)
            
            HStack {
                ImageTextView(imageName: "sunrise.fill", title: "Sunrise", subtitle: "8:01 AM")
                Spacer()
                ImageTextView(imageName: "sunset.fill", title: "Sunrise", subtitle: "8:01 AM")
            }
            
            Button(action: toggleAnimation) {
                Text(isAnimating ? "Reset" : "Animate")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Weather")
    }

    private func toggleAnimation() {
        isAnimating.toggle()
        withAnimation(.easeInOut(duration: 4)) {
            progress = isAnimating ? 0.7 : 0
        }
    }
}

#Preview {
    WeatherView().preferredColorScheme(.dark)
    
}
