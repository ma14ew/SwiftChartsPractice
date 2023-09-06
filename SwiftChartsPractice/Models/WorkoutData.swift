//
//  WorkoutData.swift
//  SwiftChartsPractice
//
//  Created by Матвей Матюшко on 06.09.2023.
//

import Foundation

struct WorkoutData: Identifiable {
    var hourOfDay: String
    var minutes: Int
    var id = UUID()
}
