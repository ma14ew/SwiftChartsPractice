//
//  ViewModel.swift
//  SwiftChartsPractice
//
//  Created by Матвей Матюшко on 04.09.2023.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var isStarted = true
    
    @Published var someData: [SomeData] = []
    
    @Published var runData: [RunData] = []
    @Published var weightData: [WeightData] = []
    @Published var pulseData: [HeartBeatData] = []
    @Published var workData: [WorkoutData] = []
    
    @Published var onlineData: [OnlineHeartbeatData] = []
    
    @Published var timer: Timer?
    @Published var onlineSeconds: Int = 0
    @Published var buttonText: String = "Старт"
    
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.someData = [SomeData(x: 0,
                                      y: 0),
                             SomeData(x: 1,
                                      y: 1),
                             SomeData(x: 2,
                                      y: 2),
                             SomeData(x: 3,
                                      y: 3),
                             SomeData(x: 4,
                                      y: 4),
                             SomeData(x: 5,
                                      y: 5),
                             SomeData(x: 6,
                                      y: 6),]
            self.runData = [RunData(dayOfWeek: "ПН",
                                    distance: 10000),
                            RunData(dayOfWeek: "ВТ",
                                    distance: 15000),
                            RunData(dayOfWeek: "СР",
                                    distance: 3000),
                            RunData(dayOfWeek: "ЧТ",
                                    distance: 4000),
                            RunData(dayOfWeek: "ПТ",
                                    distance: 3000),
                            RunData(dayOfWeek: "СБ",
                                    distance: 10000),
                            RunData(dayOfWeek: "ВС",
                                    distance: 30000)]
            self.weightData = [WeightData(dayOfWeek: "ПН",
                                          weight: 100),
                               WeightData(dayOfWeek: "ВТ",
                                          weight: 101),
                               WeightData(dayOfWeek: "СР",
                                          weight: 99),
                               WeightData(dayOfWeek: "ЧТ",
                                          weight: 100),
                               WeightData(dayOfWeek: "ПТ",
                                          weight: 101),
                               WeightData(dayOfWeek: "СБ",
                                          weight: 101),
                               WeightData(dayOfWeek: "ВС",
                                          weight: 101)]
            self.pulseData = [HeartBeatData(dayOfWeek: "ПН",
                                            minPulse: 46,
                                            maxPulse: 140),
                              HeartBeatData(dayOfWeek: "ВТ",
                                            minPulse: 54,
                                            maxPulse: 130),
                              HeartBeatData(dayOfWeek: "СР",
                                            minPulse: 40,
                                            maxPulse: 120),
                              HeartBeatData(dayOfWeek: "ЧТ",
                                            minPulse: 48,
                                            maxPulse: 130),
                              HeartBeatData(dayOfWeek: "ПТ",
                                            minPulse: 47,
                                            maxPulse: 129),
                              HeartBeatData(dayOfWeek: "СБ",
                                            minPulse: 50,
                                            maxPulse: 130),
                              HeartBeatData(dayOfWeek: "ВС",
                                            minPulse: 51,
                                            maxPulse: 141)]
            self.workData = [WorkoutData(hourOfDay: "1:00",
                                         minutes: 1),
                             WorkoutData(hourOfDay: "2:00",
                                         minutes: 1),
                             WorkoutData(hourOfDay: "3:00",
                                         minutes: 1),
                             
                             WorkoutData(hourOfDay: "4:00",
                                         minutes: 1),
                             
                             WorkoutData(hourOfDay: "5:00",
                                         minutes: 1),
                             
                             WorkoutData(hourOfDay: "6:00",
                                         minutes: 1),
                             
                             WorkoutData(hourOfDay: "7:00",
                                         minutes: 1),
                             
                             WorkoutData(hourOfDay: "8:00",
                                         minutes: 0),
                             
                             WorkoutData(hourOfDay: "9:00",
                                         minutes: 0),
                             
                             WorkoutData(hourOfDay: "10:00",
                                         minutes: 0),
                             
                             WorkoutData(hourOfDay: "11:00",
                                         minutes: 0),
                             
                             WorkoutData(hourOfDay: "12:00",
                                         minutes: 0)]
            self.isLoading = false
        }
    }
    
    
    
    
    // MARK: real time Data
    
    func generateData() {
        onlineData = [
            OnlineHeartbeatData(second: "1",
                                averageHeartBeat: Double.random(in: 40..<50))
        ]
    }
    
    @objc func startRealTimeUpdates() {
        onlineSeconds += 1
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.onlineData.append(OnlineHeartbeatData(second: String(onlineSeconds),
                                                             averageHeartBeat: Double.random(in: 40..<100)))
        }
    }
    
    func createTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(startRealTimeUpdates),
                                         userInfo: nil,
                                         repeats: true)
            self.timer = timer
        }
        
    }
    
    func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
}
