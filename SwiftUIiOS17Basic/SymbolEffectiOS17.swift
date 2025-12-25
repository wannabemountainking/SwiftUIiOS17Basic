//
//  SymbolEffectiOS17.swift
//  SwiftUIiOS17Basic
//
//  Created by YoonieMac on 12/25/25.
//

import SwiftUI

// SymbolEffect 를 통해서 SF Symbol에 animation 효과를 넣을 수 있습니다.
struct SymbolEffectiOS17: View {
    @State private var startAnimation: Bool = false
    
    var body: some View {
        List {
            Label {
                //title
                Text("색 변형 - variableColor")
            } icon: {
                Image(systemName: "airplayaudio")
                    .foregroundStyle(.mint)
                    .symbolEffect(.variableColor)
            }
            
            Label {
                //title
                Text("경고 표시 알림 - Pulse")
            } icon: {
                Image(systemName: "airplayaudio.badge.exclamationmark")
                    .foregroundStyle(.red, .mint)
                    .symbolEffect(.pulse)
            }
            
            Label {
                //title
                Text("Start Button 누르면 시작")
            } icon: {
                // Value 값이 변하면 Animation 시작
                Image(systemName: "lightbulb.max.fill")
                    .foregroundStyle(.mint)
                    .symbolEffect(.bounce, options: SymbolEffectOptions.repeat(2), value: startAnimation)
            }
            
            Button("Start Button") {
                startAnimation.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    SymbolEffectiOS17()
}
