//
//  OnlineHeartBeatDataView.swift
//  SwiftChartsPractice
//
//  Created by Матвей Матюшко on 06.09.2023.
//

import Foundation
import SwiftUI
import Charts

struct OnlineHeartBeatDataView: View {
    @ObservedObject var model: ViewModel
    @State var stopTimer = true
    var body: some View {
        VStack()  {
            Text("Пульс в реальном времени")
                .font(.system(.largeTitle, weight: .semibold))
                .frame(alignment: .leading)
                .padding(.bottom, 10)
            VStack {
                Chart {
                    ForEach(0..<model.onlineData.count, id: \.self) { item in
                        Plot {
                            LineMark(
                                x: .value("Минут", model.onlineData[item].second),
                                y: .value("Средний пульс", model.onlineData[item].averageHeartBeat)
                            )
                            PointMark(
                                x: .value("Минут", model.onlineData[item].second),
                                y: .value("Средний пульс", model.onlineData[item].averageHeartBeat))
                        }.foregroundStyle(.red)
                    }
                }.drawingGroup()
            }.frame(height: 600)
                .padding(.all, 15)
                .onAppear() {
                    model.generateData()
                }
            HStack(alignment: .center) {
                Button(model.buttonText,
                       action: {
                    if model.timer == nil {
                        model.buttonText = "стоп"
                        model.generateData()
                        model.createTimer()
                    } else {
                        model.stopTimer()
                        model.buttonText = "старт"
                    }
                })
            }.frame(
                    height: 30,
                    alignment: .center)
            .padding(.all, 15)
        }
    }
}
