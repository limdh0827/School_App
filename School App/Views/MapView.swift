//
//  MapView.swift
//  School App
//
//  Created by 임도협 on 6/10/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    @State var showTrackingView = false
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $locationViewModel.defaultRegion, showsUserLocation: true, annotationItems: MapLocations, annotationContent: {location in
                MapAnnotation(
                    coordinate: location.coordinate,
                    content: {
                        VStack {
                            Image(systemName: "graduationcap.circle.fill").foregroundColor(.red)
                                .font(.system(size: 30))
                            Text(location.name)
                                .padding(.horizontal, 5)
                                .padding(.vertical, 2)
                                .background(.black)
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                )
            })
            .ignoresSafeArea(.all)
            
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.backward.circle")
                        .padding(9)
                        .background(.black)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                        .clipShape(Capsule())
                        .padding()
                }
                
                Button(action: {
                    showTrackingView.toggle()
                }) {
                    Text("트래킹 보기")
                        .padding(.horizontal, 14)
                        .padding(.vertical, 9)
                        .background(.black)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                        .clipShape(Capsule())
                        .padding()
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showTrackingView) {
            TrackingView()
                .presentationDetents([.medium, .large])
                .environmentObject(locationViewModel)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(LocationViewModel())
    }
}
