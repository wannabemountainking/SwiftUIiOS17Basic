//
//  ObservationiOS17.swift
//  SwiftUIiOS17Basic
//
//  Created by YoonieMac on 12/25/25.
//

import SwiftUI

struct ObservationiOS17: View {
    
    // 기존에 ViewModel에서 가져오기 -> EnvironmentObject로
    @EnvironmentObject private var vm1: UserObservableObject
    
    // iOS17 부터는 -> Environment로 가져옴
    @Environment(UserObservableMacro.self) private var vm2
    
    var body: some View {
        // MARK: - 중요!! iOS17부터 Observable Object  --  @Bindable -- body
        // 위에서 vm2를 environment로 불러오고 body 안쪽에 @Bindable 해줘야 body와 연결해서 사용 가능: Environment는 Object가 아니므로 참조가 안됨(binding을 해줘야 함)
        @Bindable var vm2 = vm2
        
        VStack(spacing: 20) {
            Text("1. VM 비교")
                .font(.title)
            
            // vm1
            HStack {
                Menu("\(vm1.name) : \(vm1.number)") {
                    ForEach(10..<20) { index in
                        Button(String(index)) {
                            vm1.number = index
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.pink)
                
                Spacer()
                
                Toggle("VM1 Toggle", isOn: $vm1.isClick)
            }
            
            // vm2
            HStack {
                Menu("\(vm2.name) : \(vm2.number)") {
                    ForEach(30..<40) { index in
                        Button(String(index)) {
                            vm2.number = index
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                Spacer()
                
                Toggle("VM2 Toggle", isOn: $vm2.isClick)
            }
            
            Divider()
            
            Text("2. SubView 비교")
                .font(.title)
            
            // BindingView1 연결 - @ObservedObject 사용(기존에 MainView -> Subview로 넘길때)
            BindingView1(vm1: vm1)
            
            // BindingView2 연결 = ViewModel 연결 시 custom Object mutable 값이므로 @Bindable 사용
            BindingView2(vm3: vm2)
        }
        .font(.title2)
        .padding()
    }
}

// MARK: - SUBVIEW
struct BindingView1: View {
    // 기존에 Subview에서 ViewModel 넘길 때
    @ObservedObject var vm1: UserObservableObject
    
    var body: some View {
        // vm1
        HStack {
            Menu("\(vm1.name) : \(vm1.number)") {
                ForEach(10..<20) { index in
                    Button(String(index)) {
                        vm1.number = index
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
            
            Spacer()
            
            Toggle("VM1 Toggle", isOn: $vm1.isClick)
        }
    }
}

struct BindingView2: View {
    
    @Bindable var vm3: UserObservableMacro
    
    var body: some View {
        HStack {
            Menu("\(vm3.name) : \(vm3.number)") {
                ForEach(30..<40) { index in
                    Button(String(index)) {
                        vm3.number = index
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
            
            Spacer()
            
            Toggle("VM2 Toggle", isOn: $vm3.isClick)
        }
    }
}

#Preview {
    ObservationiOS17()
        .environmentObject(UserObservableObject())
        .environment(UserObservableMacro())
}
