//
//  LoadingSubView.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 9/10/24.
//

import SwiftUI

struct LoadingSubView: View {
    
    // MARK: - PROPERTIES
    var width: CGFloat
    var height: CGFloat
    var lineWidth: CGFloat
    
    @State private var isLoading = false
    
    // MARK: - CONSTRUCTOR
    init(
        width: CGFloat = 50.0,
        height: CGFloat = 50.0,
        lineWidth: CGFloat = 10
    ) {
        self.width = width
        self.height = height
        self.lineWidth = lineWidth
    }
    
    // MARK: - CONTENT BODY
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: lineWidth)
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color.gray, lineWidth: lineWidth/2)
                .frame(width: width, height: height)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .onAppear() {
                    self.isLoading = true
                }
        }
    }
    
}
