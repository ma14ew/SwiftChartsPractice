//
//  RectangleMarkChart.swift
//  SwiftChartsPractice
//
//  Created by Матвей Матюшко on 04.09.2023.
//


import Foundation
import SwiftUI
import Charts

struct RectangleMarkChart: View {
    @State var data: [WorkoutData]
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text("Время разминки")
                    .font(.system(.largeTitle, weight: .semibold))
                VStack {
                    Chart {
                        ForEach(data) { timez in
                            RectangleMark(
                                x: .value("Время", timez.hourOfDay),
                                y: .value("Минуты разминки", timez.minutes))
                        }
                    }
                }.frame(height: 300)
            }
        }
    }
}
