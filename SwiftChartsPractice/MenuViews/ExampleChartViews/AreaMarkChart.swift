//
//  AreaMarkChart.swift
//  SwiftChartsPractice
//
//  Created by Матвей Матюшко on 04.09.2023.
//

import Foundation
import SwiftUI
import Charts

struct AreaMarkChart: View {
    @State var data: [SomeData]
    var body: some View {
        VStack(alignment: .leading)  {
            Text("Диаграмма с областями")
                .font(.system(.largeTitle, weight: .semibold))
                .frame(alignment: .leading)
            Chart {
                ForEach(data) { item in
                    AreaMark(
                        x: .value("x", item.x),
                        y: .value("y", item.y)
                    )
                }
            }
        }
    }
}
