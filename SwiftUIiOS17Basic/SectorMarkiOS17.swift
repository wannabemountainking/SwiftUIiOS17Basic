//
//  SectorMarkiOS17.swift
//  SwiftUIiOS17Basic
//
//  Created by YoonieMac on 12/24/25.
//

import SwiftUI
import Charts

struct SectorMarkData: Identifiable {
    let id = UUID()
    let label: String
    let value: Int
    
    static func fetchData() -> [SectorMarkData] {
        [
            SectorMarkData(label: "yoonie", value: 50),
            SectorMarkData(label: "Jinnie", value: 30),
            SectorMarkData(label: "Ian", value: 5),
            SectorMarkData(label: "John", value: 15),
        ]
    }
}

struct SectorMarkiOS17: View {
    private let records: [SectorMarkData] = SectorMarkData.fetchData()
    
    var body: some View {
        VStack {
            Chart(records) { sectorMark in
                // 1. pie chart
                // .angle: 차트에서 나누는 기준값(각도가 그렇지?)
                // .angluarInset: 파이 차트 안에서 나눠지는 구분선 넓이
                SectorMark(angle: .value("Record", sectorMark.value), angularInset: 4)
                    .cornerRadius(10)
                    .blur(radius: sectorMark.label == "yoonie" ? 5 : 0)
                    .foregroundStyle(by: .value("Record Label", sectorMark.label))
            }
            .padding(.horizontal)
            
            Chart(records) { sectorMark in
                // 2. Donut chart
                SectorMark(
                    angle: .value("Record", sectorMark.value),
                    // innerRadius: 안의 도넛 크기 원형 설정
                    innerRadius: MarkDimension.ratio(0.5),
                    // outerRadius: 도넛 바깥에 얼마나 padding 값을 주는 지 설정
                    outerRadius: MarkDimension.inset(50)
                )
                .foregroundStyle(by: .value("Record Label", sectorMark.value))
            }
            .padding(.horizontal)
        }
        .chartLegend(position: .bottom, alignment: .center, spacing: 10)
        .dynamicTypeSize(.accessibility2) // 색을 나누는 레이블이 지칭하는 것(여기서는 이름)을 글자 크게
    }
}

#Preview {
    SectorMarkiOS17()
}
