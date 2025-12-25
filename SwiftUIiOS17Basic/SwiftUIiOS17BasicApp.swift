//
//  SwiftUIiOS17BasicApp.swift
//  SwiftUIiOS17Basic
//
//  Created by YoonieMac on 12/24/25.
//

import SwiftUI

@main
struct SwiftUIiOS17BasicApp: App {
    
    // 기존에 ViewModel에서 Environment 로 넘겨서 전체 App 단위로 사용할 때 방식
    @StateObject private var vm1 = UserObservableObject()
    
    // iOS17부터 변경된 방식
    @State private var vm2 = UserObservableMacro()
    
    var body: some Scene {
        WindowGroup {
            ObservationiOS17()
                .environmentObject(vm1) // 기존 방식: EnvironmentObject로 넘겨줌
                .environment(vm2) // iOS17 부터는 environment로 그냥 넘김
        }
    }
}
