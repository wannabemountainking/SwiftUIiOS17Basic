//
//  OnBoarding.swift
//  SwiftUIiOS17Basic
//
//  Created by YoonieMac on 12/26/25.
//

import SwiftUI


struct OnBoarding: View {
    
    private let data: [(text: String, systemImage: String)] = [
        (text: "환영합니다", systemImage: "star.fill"),
        (text: "간편한 사용", systemImage: "hand.thumbsup.fill"),
        (text: "시작하기", systemImage: "arrow.right.circle.fill")
    ]
    
    var body: some View {
        
        TabView {
            ForEach(0..<data.count, id: \.self) { index in
                let datum = data[index]
                VStack {
                    ContentUnavailableView(
                        datum.text,
                        systemImage: datum.systemImage
                    )
                    .frame(height: 500)
                    
                    if index == data.count - 1 {
                        Text("모든 준비가 완료되었습니다.\n이제 앱을 시작해보세요")
                            .font(.body)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                        
                        Spacer()
                        
                        Button("시작") {
                            print("시작")
                        }
                        .font(.title2)
                        
                        Spacer()
                    }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    OnBoarding()
}
