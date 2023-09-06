//
//  BarMarkChart.swift
//  SwiftChartsPractice
//
//  Created by Матвей Матюшко on 03.09.2023.
//

// BarMark, LineMark, AreaMark, PointMark, RectangleMark, RuleMark

import Foundation
import SwiftUI
import Charts

struct BarMarkChart: View {
    @State var data: [RunData]
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text("Количество шагов по дням недели")
                    .font(.system(.largeTitle, weight: .semibold))
                VStack {
                    Chart {
                        ForEach(data) { day in
                            BarMark(
                                x: .value("День недели", day.dayOfWeek),
                                y: .value("Дистанция", day.distance)
                            )
                        }.foregroundStyle(.orange)
                    }
                }.frame(height: 400)
                Text("Подсчет шагов - количество шагов, сделанных Вами за день. Шагомеры и цифровые трекеры активности могут помочь Вам в подсчете шагов. Эти устройства подсчитывают шаги при любой активности, похожей на шагание: ходьбе, беге, подьеме по лестнице, катании на беговых лыжах и даже движении при повседневных домашних делах.")
            }
        }
    }
}
