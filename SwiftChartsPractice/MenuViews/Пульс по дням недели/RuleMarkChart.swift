//
//  RuleMarkChart.swift
//  SwiftChartsPractice
//
//  Created by Матвей Матюшко on 04.09.2023.
//

import Foundation
import SwiftUI
import Charts

struct RuleMarkChart: View {
    @State var data: [HeartBeatData]
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text("Пульс")
                    .font(.system(.largeTitle, weight: .semibold))
                VStack {
                    Chart {
                        ForEach(data) { pulse in
                            RuleMark(
                                x: .value("День недели", pulse.dayOfWeek),
                                yStart: pulse.minPulse,
                                yEnd: pulse.maxPulse
                            ).foregroundStyle(.red)
                                .lineStyle(.init(lineWidth: 10, lineCap: .round))
                        }
                    }.chartYAxis(.visible)
                }.frame(height: 400)
                Text("Ваше сердце бьется примерно 100 000 раз в день, ускоряясь и замедляясь в периоды покоя и напряжения. Ваш пульс - это количество ударов сердца в минуту. Он является показателем того, насколько здорова Ваша сердечно-сосудистая система.")
            }
        }
    }
}
