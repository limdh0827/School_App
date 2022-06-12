//
//  HomeView.swift
//  School App
//
//  Created by 임도협 on 6/8/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var locationViewModel = LocationViewModel()
    
    var body: some View {
        Form {
            switch locationViewModel.authorizationStatus {
            case .notDetermined:
                MenuItemPrimary(menuContent: MenuItemPrimaryContent(title: "개인정보 수집 및 이용 동의", icon: "hand.raised.fill", tint: .blue,prefix: "개인 위치 정보 이용", suffix: "승인하기", image: "location.fill", destination:AnyView(RequestLocationView().environmentObject(locationViewModel))))
            case .restricted:
                MenuItemError(errorContent: MenuItemErrorContent(prefix: "개인 위치 정보 이용", suffix: "제한됨", description: "이 카드를 터치해 설정으로 이동합니다.", image: "exclamationmark.triangle.fill", url: URL(string:UIApplication.openSettingsURLString)!))
            case .denied:
                MenuItemError(errorContent: MenuItemErrorContent(prefix: "개인 위치 정보 이용", suffix: "거부됨", description: "이 카드를 터치해 설정으로 이동합니다.", image: "exclamationmark.triangle.fill", url: URL(string:UIApplication.openSettingsURLString)!))
            case .authorizedAlways, .authorizedWhenInUse:
                MenuItemPrimary(menuContent: MenuItemPrimaryContent(title: "등교하기", icon: "figure.walk", tint: .pink,prefix: "출석 체크까지", suffix: "20분 남음", image: "timer", destination: AnyView(MapView().environmentObject(locationViewModel))))
                
                
                if let vm = locationViewModel {
                    if let currentSpeed = vm.lastSeenLocation?.speed, let distance = vm.distance, let targetSpeed = vm.targetSpeed {
                        MenuItemMetric(metricValues: MenuItemMetricValues(remainingTime: (0, 0), currentSpeed: currentSpeed, targetSpeed: targetSpeed, distance: distance))
                    }
                }
            default:
                Text("오류 발생!")
            }
            
        }
        .navigationTitle("학교 가자 😪")
        //        .toolbar {
        //            ToolbarItem(placement: .navigationBarTrailing) {
        //                NavigationLink(destination: )
        //            }
        //        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
