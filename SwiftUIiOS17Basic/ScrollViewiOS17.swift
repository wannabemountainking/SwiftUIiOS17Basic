//
//  ScrollViewiOS17.swift
//  SwiftUIiOS17Basic
//
//  Created by YoonieMac on 12/25/25.
//

import SwiftUI

struct ScrollViewiOS17: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 30) {
                ForEach(1...3, id: \.self) { index in
                    Image("mobile\(String(index))")
                        .padding(.horizontal)
                    // horizontal 방향으로 사진 가운데 정렬
                        .containerRelativeFrame(.horizontal)
                }
            }
            //오직 main view에서만 ScrollView가 되고 안에 있는 subview는 ScrollView가 안되게 설정하기(LazyHStack에서 설정)
            .scrollTargetLayout() // 요 안이 Target이 됨 => 1개 화면이 타겟으로 설정되어 페이징이 정확하게 됨
        }
        .scrollTargetBehavior(.viewAligned)
    }
}

struct ScrollTransitioniOS17: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 20) {
                ForEach(1...30, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.blue.gradient)
                        .frame(height: 200)
                    // Scroll Transition: 스크롤을 자연스럽게
                        .scrollTransition(
                            topLeading: .interactive,
                            bottomTrailing: .interactive) { view, phase in
                                view
                                    .opacity(1 - (phase.value < 0 ? -phase.value : phase.value))
                            }
                }
            }
        }
    }
}

#Preview("Paging") {
    ScrollViewiOS17()
}

#Preview("Scroll Transition") {
    ScrollTransitioniOS17()
}
