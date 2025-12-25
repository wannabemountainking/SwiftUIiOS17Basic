//
//  ContentUnavailableViewiOS17.swift
//  SwiftUIiOS17Basic
//
//  Created by YoonieMac on 12/24/25.
//

import SwiftUI

struct ContentUnavailableViewiOS17: View {
    
// MARK: - ContentUnavailable : Image와 Text를 합쳐서 전체 스크린에 나타냄 -> 말 그대로 Content가 unavailable 즉 사용할 수 없는 상태 UI에 Error 표시할 때 유용함.
    var body: some View {
        ContentUnavailableView("BAD CONNECTION", systemImage: "wifi.exclamationmark", description: Text("인터넷이 연결되어 있지 않습니다."))
        
        Divider()
        
        ContentUnavailableView {
            // label
            Label("정말로 삭제하시겠습니까?", systemImage: "questionmark.circle.fill")
        } description: {
            Text("아래 삭제 버튼을 누르면 영구 삭제 됩니다.")
        } actions: {
            HStack(spacing: 30) {
                Button("Cancel", role: .cancel) {
                    //Cancel Action
                }
                Button("Delete", role: .destructive) {
                    // Delete Action
                }
                .buttonStyle(.borderedProminent)
            }
            .fixedSize()
        }
    }
}

struct ContentUnavailablePaging: View {
    var body: some View {
        // TabView를 이용하여 간단하게 page 형식으로도 만들 수 있습니다.
        TabView {
            ContentUnavailableView("SwiftUI", image: "mobile1", description: Text("SwiftUI로 여러 가지 App을 만들 수 있습니다"))
            ContentUnavailableView("Sync", image: "mobile2", description: Text("아이폰과 아이패드를 iCloud로 동기화 합니다"))
            ContentUnavailableView("Shopping App", image: "mobile3", description: Text("온라인 쇼핑 App을 SwiftUI로 만듭니다"))
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview("Intro") {
    ContentUnavailableViewiOS17()
}

#Preview("Paging") {
    ContentUnavailablePaging()
}
