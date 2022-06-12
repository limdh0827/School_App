//
//  TrackingView.swift
//  School App
//
//  Created by 임도협 on 6/8/22.
//

import SwiftUI
import CoreLocation

struct TrackingView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    var body: some View {
        VStack {
            VStack {
                Text("실시간 GPS 트래킹")
                    .font(.system(size: 40, weight: .bold))
                
                Text("상대성 이론에 의해 보정된 값입니다.")
                    .font(.caption)
            }
            .padding(.bottom, 10)
            
            VStack(spacing: 20) {
                TrackingDataView(
                    name: "위도 (°)",
                    value: String(format: "%.7f", coordinate?.latitude ?? 0)
                )
                TrackingDataView(
                    name: "경도 (°)",
                    value: String(format: "%.7f", coordinate?.longitude ?? 0)
                )
                TrackingDataView(
                    name: "고도 (m)",
                    value: String(format: "%.1f", locationViewModel.lastSeenLocation?.altitude ?? 0)
                )
                TrackingDataView(
                    name: "속도 (m/s)",
                    value: String(format: "%.1f", locationViewModel.lastSeenLocation?.speed ?? 0)
                )
            }
        }
    }
    
    var coordinate: CLLocationCoordinate2D? {
        locationViewModel.lastSeenLocation?.coordinate
    }
}

struct TrackingDataView: View {
    let name: String
    let value: String
    
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .frame(width: 150, height: 20)
                    .padding()
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(10)
                
                Text(value)
                    .frame(width: 120, height: 20)
                    .padding()
                    .foregroundColor(.black)
                    .background(.white)
                    .border(.black, width: 5)
                    .cornerRadius(5)
            }
        }
    }
}
