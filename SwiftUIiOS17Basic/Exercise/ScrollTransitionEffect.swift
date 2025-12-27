//
//  ScrollTransitionEffect.swift
//  SwiftUIiOS17Basic
//
//  Created by YoonieMac on 12/27/25.
//

import SwiftUI

struct ScrollTransitionEffect: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 20) {
                ForEach(1...10, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green.gradient)
                        .frame(height: 150)
                        .frame(maxWidth: .infinity)
                        .scrollTransition(
                            topLeading: .interactive,
                            bottomTrailing: .interactive) { content, phase in
                                content
                                    .opacity(1 - abs(phase.value) * 0.9)
                                    .scaleEffect(1 - abs(phase.value) * 0.9)
                            }
                }//: Loop
            }//: LazyVStack
        }//: ScrollView
    }//: body
}

#Preview {
    ScrollTransitionEffect()
}
