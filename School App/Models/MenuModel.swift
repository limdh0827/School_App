//
//  MenuModel.swift
//  School App
//
//  Created by 임도협 on 6/12/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct MenuItemPrimaryContent {
    var title: String
    var icon: String
    var tint: Color
    var prefix: String
    var suffix: String
    var image: String
    var destination: AnyView
}

struct MenuItemErrorContent {
    var prefix: String
    var suffix: String
    var description: String
    var image: String
    var url: URL
}

struct MenuItemMetricValues {
    var remainingTime: (Int, Int)
    var currentSpeed: Double
    var targetSpeed: Double
    var distance: Double
}
