//
//  DashboardData.swift
//  OpenInApp
//
//  Created by Naveen Katari  on 30/04/24.
//

import SwiftUI
import Charts

struct ChartData {
    var month: String
    var value: Double
}

struct LineChartView: View {
    var data = [ChartData]()

    var body: some View {
        VStack {
            Chart {
                ForEach(data, id: \.month) { point in
                    LineMark(
                        x: .value("Month", point.month),
                        y: .value("Value", point.value)
                    )
                }
            }
            .frame(height: 210)
            .padding([.top, .leading], 20)
            .background(RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(radius: 5))
            .padding(.horizontal) 
        }
        .chartYAxis {
            AxisMarks(preset: .automatic, position: .leading) {
                AxisGridLine()
                AxisValueLabel()
            }
        }
        .chartXAxis {
            AxisMarks(preset: .automatic, position: .bottom) {
                AxisGridLine()
                AxisValueLabel()
            }
        }
    }
}


