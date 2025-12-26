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
    
    var id: String {
        switch self {
        case .connected: return "connected"
        case .connecting: return "connecting"
        case .disconnected: return "disconnected"
        }
    }
    
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
    
    var symbolEffect: (any SymbolEffect)? {
        switch self {
        case .connected: return .variableColor
        case .connecting: return .pulse
        case .disconnected: return nil
        }
    }
}


struct WifiStatusView: View {
    @State private var currentWifiStatus: WifiStatus = .disconnected
    private var wifiStates: [WifiStatus] = WifiStatus.allCases
    
    var body: some View {
        VStack(spacing: 30) {
            // 현재 선택된 뷰
            Image(systemName: currentWifiStatus.icon)
                .foregroundStyle(currentWifiStatus.iconColor)
                .modifier(SymbolEffect)
            
            // 전체 뷰 리스트
        }
        
        
        List {
            HStack(spacing: 20) {
                Image(systemName: "wifi")
                    .foregroundStyle(.mint)
                    .symbolEffect(.variableColor)
                Text("연결됨")
            }
            HStack(spacing: 20) {
                Image(systemName: "wifi")
                    .foregroundStyle(.blue)
                    .symbolEffect(.pulse)
                Text("연결 중...")
            }
            HStack(spacing: 20) {
                Image(systemName: "wifi.slash")
                    .foregroundStyle(.gray)
                Text("연결 끊김")
            }
        }
    }
}

#Preview {
    WifiStatusView()
}
