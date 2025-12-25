//
//  UserViewModeliOS17.swift
//  SwiftUIiOS17Basic
//
//  Created by YoonieMac on 12/25/25.
//

import Foundation
import Combine

// MARK: - 기존에 만들었던 ViewModel에서 mutable object를 다루는 방식(ObservableObject, @Published ...)
class UserObservableObject: ObservableObject {
    let name: String = "vm1"
    @Published var number: Int = 0
    @Published var isClick: Bool = false
}

// MARK: - iOS17 부터는 @Observable 사용하기
@Observable
class UserObservableMacro {
    let name: String = "vm2"
    var number: Int = 0
    var isClick: Bool = false
}
