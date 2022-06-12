//
//  MenuItem.swift
//  School App
//
//  Created by 임도협 on 6/12/22.
//

import SwiftUI
import UIKit

struct MenuItemPrimary: View {
    var menuContent: MenuItemPrimaryContent
    
    var body: some View {
        NavigationLink(destination: menuContent.destination) {
            VStack(alignment: .leading) {
                Label(menuContent.title, systemImage: menuContent.icon)
                    .labelStyle(.titleAndIcon)
                    .font(.system(size: 13))
                    .foregroundColor(menuContent.tint)
                    .bold()
                
                Spacer(minLength: 0)
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(menuContent.prefix)
                            .font(.system(size: 15))
                            .padding(.bottom, 1)
                        
                        Text(menuContent.suffix)
                            .font(.system(size: 37, weight: .bold))
                    }
                    .foregroundColor(.black)
                    
                    Spacer()
                    
                    Image(systemName: menuContent.image)
                        .font(.system(size: 75))
                        .foregroundColor(menuContent.tint)
                }
            }
            .padding(.vertical)
            .cornerRadius(10)
        }
    }
}

struct MenuItemError: View {
    var errorContent: MenuItemErrorContent
    
    var body: some View {
        Button(action: {
            UIApplication.shared.open(errorContent.url)
        }) {
            VStack(alignment: .leading) {
                Label("오류 발생", systemImage: "exclamationmark.square.fill")
                    .labelStyle(.titleAndIcon)
                    .font(.system(size: 13))
                    .foregroundColor(.red)
                    .bold()
                
                Spacer(minLength: 0)
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(errorContent.prefix)
                            .font(.system(size: 15))
                            .padding(.bottom, 1)
                        
                        Text(errorContent.suffix)
                            .font(.system(size: 37, weight: .bold))
                        
                        Text(errorContent.description)
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                    .foregroundColor(.black)
                    
                    Spacer()
                    
                    Image(systemName: errorContent.image)
                        .font(.system(size: 75))
                        .foregroundColor(.red)
                }
            }
            .padding(.vertical)
            .cornerRadius(10)
        }
    }
}


struct MenuItemMetric: View {
    var metricValues: MenuItemMetricValues
    
    var body: some View {
        VStack(alignment: .leading) {
            Label("등교중 물리량", systemImage: "speedometer")
                .labelStyle(.titleAndIcon)
                .font(.system(size: 13))
                .foregroundColor(.green)
                .bold()
            
            Spacer(minLength: 0)
            
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("현재 속도")
                        .font(.system(size: 15))
                        .padding(.bottom, 1)
                    
                    Text("\(currentSpeed(metricValues.currentSpeed), specifier: "%.1f")m/s")
                        .font(.system(size: 37, weight: .bold))
                        .foregroundColor(speedForegroundColor(metricValues.currentSpeed, metricValues.targetSpeed))
                }
                
                Spacer()
                
                Image(systemName: "arrow.forward.circle")
                    .imageScale(.large)
                    
                Spacer()
                
                VStack(alignment: .trailing, spacing: 0) {
                    Text("목표 속도")
                        .font(.system(size: 15))
                        .padding(.bottom, 1)
                    
                    Text("\(metricValues.targetSpeed, specifier: "%.1f")m/s")
                        .font(.system(size: 37, weight: .bold))
                        .foregroundColor(.blue)
                }
            }
            
            Spacer(minLength: 0)
            
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("남은 거리")
                        .font(.system(size: 15))
                        .padding(.bottom, 1)
                    
                    Text("\(metricValues.distance, specifier: "%.1f")m")
                        .font(.system(size: 37, weight: .bold))
                        .foregroundColor(.orange)
                }
            }
        }
        .padding(.vertical)
        .cornerRadius(10)
    }
    
    func currentSpeed(_ data: Double) -> Double {
        if data == -1.0 {
            return 0
        } else {
            return data
        }
    }
    
    func speedForegroundColor(_ current: Double, _ target: Double) -> Color {
        if current >= target {
            return .blue
        } else {
            return .red
        }
    }
}

//struct MenuItem_Previews: PreviewProvider {
//    static var previews: some View {
//        //        MenuItemError(errorContent: MenuItemErrorContent(prefix: "prefix", suffix: "suffix", description: "이 카드를 터치해 설정으로 이동합니다.", image: "location.fill", url: URL(string:UIApplication.openSettingsURLString)!))
//
//
//    }
//}
