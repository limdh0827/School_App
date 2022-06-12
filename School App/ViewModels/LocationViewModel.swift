//
//  LocationViewModel.swift
//  School App
//
//  Created by 임도협 on 6/8/22.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var lastSeenLocation: CLLocation?
    @Published var currentPlacemark: CLPlacemark?
    @Published var speed: CLLocationSpeed?
    @Published var targetSpeed: Double?
    @Published var distance: CLLocationDistance?
    @Published var targetTime: Date
    @Published var remainingTime: Int?
    @Published var debugMode: Bool = false
    
    @Published var defaultRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.349999, longitude: 127.335163),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )
    
    private let locationManager: CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        authorizationStatus = locationManager.authorizationStatus
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        targetTime = dateFormatter.date(from: "2022-03-02T08:10:00")!
        
        
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastSeenLocation = locations.first
        
        let school = CLLocation(latitude: 36.349999, longitude: 127.335163)
        distance = locations.first?.distance(from: school)
        
        remainingTime = calculateRemainingTime()
        
//        targetSpeed = distance! / Double(remainingTime!)
        targetSpeed = 4.3
    }
    
    
    func calculateRemainingTime() -> Int {
        let current = Date()
        
        return current.compareTimeOnly(to: targetTime).rawValue
    }
}

extension Date {
    func compareTimeOnly(to: Date) -> ComparisonResult {
        let calendar = Calendar.current
        let components2 = calendar.dateComponents([.hour, .minute, .second], from: to)
        let date3 = calendar.date(bySettingHour: components2.hour!, minute: components2.minute!, second: components2.second!, of: self)!
        
        let seconds = calendar.dateComponents([.second], from: self, to: date3).second!
        
        if seconds == 0 {
            return .orderedSame
        } else if seconds > 0 {
            return .orderedAscending
        } else {
            return .orderedDescending
        }
    }
}
