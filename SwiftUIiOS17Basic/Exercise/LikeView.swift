//
//  LikeView.swift
//  SwiftUIiOS17Basic
//
//  Created by yoonie on 12/27/25.
//

import SwiftUI

struct LikeView: View {
    @State private var pickLike: Bool = false
    
    var body: some View {
        
        VStack(spacing: 50) {
            Image(systemName: pickLike ? "heart.fill" : "heart")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .foregroundStyle(pickLike ? .red : .gray)
                .symbolEffect(.bounce, options: .repeating.repeat(2), value: pickLike)
            Button {
                //action
                withAnimation {
                    pickLike.toggle()
                }
            } label: {
                Text("좋아요")
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    .padding(7)
                    .padding(.horizontal, 60)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    LikeView()
}
