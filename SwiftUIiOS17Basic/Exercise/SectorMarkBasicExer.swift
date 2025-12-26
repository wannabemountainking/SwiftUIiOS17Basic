//
//  SectorMarkExer.swift
//  SwiftUIiOS17Basic
//
//  Created by YoonieMac on 12/25/25.
//

import SwiftUI
import Charts


struct Expenditure: Identifiable, Hashable {
    let id = UUID()
    let category: String
    var amount: Double
}

struct SectorMarkBasicExer: View {
    private let expenditures: [Expenditure] = [
        Expenditure(category: "식비", amount: 300),
        Expenditure(category: "교통비", amount: 100),
        Expenditure(category: "통신비", amount: 50),
        Expenditure(category: "취미", amount: 150)
    ]
    
    var body: some View {
        Chart(expenditures) { expenditure in
            SectorMark(
                angle: .value("Value", expenditure.amount),
                angularInset: 2
            )
            .foregroundStyle(
                by: .value(
                    "Expense Category",
                    expenditure.category
                )
            )
            .cornerRadius(5)
        }
        .padding()
        .chartLegend(position: .bottom, alignment: .center, spacing: 10)
        .dynamicTypeSize(.accessibility1)
    }
}

#Preview {
    SectorMarkBasicExer()
}
