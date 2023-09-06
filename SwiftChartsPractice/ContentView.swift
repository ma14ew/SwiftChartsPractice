//
//  ContentView.swift
//  SwiftChartsPractice
//
//  Created by Матвей Матюшко on 03.09.2023.
//

// BarMark, LineMark, AreaMark, PointMark, RectangleMark, RuleMark

import SwiftUI
import Charts



struct ContentView: View {
    @ObservedObject var model: ViewModel = ViewModel()
    @State var chartType: BarType = .barMark
    var body: some View {
        if model.isLoading {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2.0, anchor: .center)
                .onAppear {
                    model.getData()
                }
        } else {
            VStack {
                HStack {
                    Spacer()
                    Menu("Диаграмма") {
                        Button("Ходьба",
                               action: {
                            self.chartType = .barMark
                        })
                        Button("Вес",
                               action: {
                            self.chartType = .lineMark
                        })
                        Button("Пульс",
                               action: {
                            self.chartType = .ruleMark
                        })
                        Button("Минуты разминки",
                               action: {
                            self.chartType = .rectangleMark
                        })
                        Button("Пульс за минуту",
                               action: {
                            self.chartType = .refreshPulse
                        })
                        Button("С областями",
                               action: {
                            self.chartType = .areaMark
                        })
                        Button("Точечная",
                               action: {
                            self.chartType = .pointMark
                        })
                    }.padding(.all, 10)
                }
                switch chartType {
                case .barMark:
                    BarMarkChart(data: model.runData)
                        .padding(.all, 10)
                case .lineMark:
                    LineMarkChart(data: model.weightData)
                        .padding(.all, 10)
                case .ruleMark:
                    RuleMarkChart(data: model.pulseData)
                        .padding(.all, 10)
                case .areaMark:
                    AreaMarkChart(data: model.someData)
                        .padding(.all, 10)
                case .pointMark:
                    PointMarkChart(data: model.someData)
                        .padding(.all, 10)
                case .rectangleMark:
                    RectangleMarkChart(data: model.workData)
                        .padding(.all, 10)
                case .refreshPulse:
                    OnlineHeartBeatDataView(model: model)
                    
                }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
