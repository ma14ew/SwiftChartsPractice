//
//  OnlineHeartbeatData.swift
//  SwiftChartsPractice
//
//  Created by Матвей Матюшко on 06.09.2023.
//

import Foundation

struct OnlineHeartbeatData: Identifiable {
    var second: String
    var averageHeartBeat: Double
    var id = UUID()
}

