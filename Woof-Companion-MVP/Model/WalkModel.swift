//
//  WalkModel.swift
//  MVVM-companion-v1
//
//  Created by François-Xavier on 02/09/2023.
//

import Foundation
import CoreData

struct WalkModel {
    var startDate: String = " N/A "
    var distance: Double = 0.0
    var duration: Double = 0.0
    var energy: Int = 0
    var speed: String = " N/A "
    var weather: String = " N/A "
    var totalInSecond: Double = 0.0
    var date: Date = Date()
    var encounter: Int = 0
}
