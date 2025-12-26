//
//  NoSearchResultView.swift
//  SwiftUIiOS17Basic
//
//  Created by YoonieMac on 12/26/25.
//

import SwiftUI

struct NoSearchResultView: View {
    var body: some View {
        ContentUnavailableView(
            "검색 결과 없음",
            systemImage: "magnifyingglass",
            description: Text("다른 검색어를 입력해주세요")
        )
    }
}

#Preview {
    NoSearchResultView()
}
