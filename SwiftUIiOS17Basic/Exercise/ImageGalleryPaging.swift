//
//  ImageGalleryPaging.swift
//  SwiftUIiOS17Basic
//
//  Created by YoonieMac on 12/27/25.
//

import SwiftUI

struct ImageGalleryPaging: View {
    @State private var currentPage: Int? = 0
    let pages = Array(0..<5)
    
    var body: some View {
        VStack {
            // page indicator
            HStack(spacing: 8) {
                ForEach(pages, id: \.self) { index in
                    Circle()
                        .fill(currentPage == index ? Color.blue : Color.gray.opacity(0.3))
                        .frame(width: 8, height: 8)
                }//: Loop
            }//: HStack
            .padding()
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(0..<5) { index in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.teal)
                                .frame(height: 400)
                                .padding(5)
//                            Text("\(index + 1)")
//                                .font(.title)
                            Text("currentPage: \(currentPage ?? -1)\nindex: \(index)")
                        }//:ZStack
                        .containerRelativeFrame(.horizontal)
                        .id(index)
                    }//: Loop
                }//: LazyHStack
                .scrollTargetLayout() // paging 대상 저장
            }//: ScrollView
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $currentPage)
        }//: VStack
    }//: Body
}

#Preview {
    ImageGalleryPaging()
}
