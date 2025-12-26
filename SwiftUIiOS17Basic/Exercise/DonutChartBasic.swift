//
//  DonutChartBasic.swift
//  SwiftUIiOS17Basic
//
//  Created by YoonieMac on 12/26/25.
//

import SwiftUI
import Charts

struct DonutChartBasic: View {
    
    private let expenseData: [Expenditure] = [
        Expenditure(category: "식비", amount: 300),
        Expenditure(category: "교통비", amount: 100),
        Expenditure(category: "통신비", amount: 50),
        Expenditure(category: "취미", amount: 150)
    ]
    
    var body: some View {
        Chart(expenseData) { expenditure in
            SectorMark(
                angle: .value("Value", expenditure.amount),
                innerRadius: .ratio(0.6),
                outerRadius: .inset(30),
                angularInset: 2
            )
            .foregroundStyle(
                by: .value(
                    "Category",
                    expenditure.category
                )
            )
            .cornerRadius(5)
        }
        .chartLegend(position: .bottom, alignment: .center)
        .dynamicTypeSize(.accessibility1)
    }
}

#Preview {
    DonutChartBasic()
}
