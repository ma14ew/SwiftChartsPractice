//
//  HeartBeatData.swift
//  SwiftChartsPractice
//
//  Created by Матвей Матюшко on 06.09.2023.
//

import Foundation

struct HeartBeatData: Identifiable {
    var dayOfWeek: String
    var minPulse: Double
    var maxPulse: Double
    var id = UUID()
}
