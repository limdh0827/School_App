//
//  MapModel.swift
//  School App
//
//  Created by 임도협 on 6/10/22.
//

import Foundation
import CoreLocation

struct MapLocation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

let MapLocations = [
    MapLocation(name: "학교", coordinate: CLLocationCoordinate2D(latitude: 36.349999, longitude: 127.335163)),
]
