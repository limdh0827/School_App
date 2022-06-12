//
//  RequestLocationView.swift
//  School App
//
//  Created by 임도협 on 6/8/22.
//

import SwiftUI

struct RequestLocationView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "location.viewfinder")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.blue)
                .padding(.bottom, 20)
            
            Button(action: {
                locationViewModel.requestPermission()
            }, label: {
                Label("위치 추적 허용하기", systemImage: "location")
            })
            .padding(10)
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct RequestLocationView_Previews: PreviewProvider {
    static var previews: some View {
        RequestLocationView()
    }
}
