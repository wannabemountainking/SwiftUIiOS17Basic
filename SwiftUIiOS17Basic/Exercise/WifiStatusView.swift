//
//  WifiStatusView.swift
//  SwiftUIiOS17Basic
//
//  Created by YoonieMac on 12/26/25.
//

import SwiftUI


enum WifiStatus: Identifiable, CaseIterable {
    case connected
    case connecting
    case disconnected
    
    var id: Self {self}
    
    var title: String {
        switch self {
        case .connected: return "연결됨"
        case .connecting: return "연결 중..."
        case .disconnected: return "연결 끊김"
        }
    }
    
    var icon: String {
        switch self {
        case .connected: return "wifi"
        case .connecting: return "wifi"
        case .disconnected: return "wifi.slash"
        }
    }
    
    var iconColor: Color {
        switch self {
        case .connected: return .mint
        case .connecting: return .accentColor
        case .disconnected: return .gray
        }
    }
}

struct WifiSymbolModifier: ViewModifier {
    let status: WifiStatus
    
    func body(content: Content) -> some View {
        switch status {
        case .connected:
            content
                .symbolEffect(.variableColor)
        case .connecting:
            content
                .symbolEffect(.pulse)
        case .disconnected:
            content
        }
    }
}

extension View {
    func wifiSymbolEffect(status: WifiStatus) -> some View {
        modifier(WifiSymbolModifier(status: status))
    }
}

struct WifiStatusView: View {
    @State private var currentWifiStatus: WifiStatus = .disconnected
    private var wifiStates: [WifiStatus] = WifiStatus.allCases
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            // 현재 선택된 뷰
            VStack(spacing: 20) {
                Image(systemName: currentWifiStatus.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .foregroundStyle(currentWifiStatus.iconColor)
                    .wifiSymbolEffect(status: currentWifiStatus)
                Text(currentWifiStatus.title)
                    .font(.title)
            }// : Section
            // 전체 뷰 리스트
            List {
                ForEach(wifiStates, id: \.id) { wifiStatus in
                    HStack(spacing: 20) {
                        Image(systemName: wifiStatus.icon)
                            .foregroundStyle(wifiStatus.iconColor)
                            .wifiSymbolEffect(status: wifiStatus)
                        Text(wifiStatus.title)
                        
                        Spacer()
                        
                        // 선택된 항목 체크 표시
                        if wifiStatus == currentWifiStatus {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(wifiStatus.iconColor)
                        }
                    }//: HStack
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            currentWifiStatus = wifiStatus
                        }
                    }
                }//: Loop
            }//: List
        }//: VStack
    }//: body
}

#Preview {
    WifiStatusView()
}
