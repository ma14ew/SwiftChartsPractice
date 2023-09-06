//
//  LineMarkChart.swift
//  SwiftChartsPractice
//
//  Created by Матвей Матюшко on 04.09.2023.
//

import Foundation
import SwiftUI
import Charts

struct LineMarkChart: View {
    var data: [WeightData]
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text("Вес")
                    .font(.system(.largeTitle, weight: .semibold))
                VStack {
                    Chart {
                        ForEach(data) { weight in
                            Plot {
                                LineMark(
                                    x: .value("День недели", weight.dayOfWeek),
                                    y: .value("Вес", weight.weight)
                                )
                                PointMark(x: .value("День недели", weight.dayOfWeek),
                                          y: .value("Вес", weight.weight))
                            }.foregroundStyle(.purple)
                        }
                    }
                }.frame(height: 600)
            }
        }
    }
}
