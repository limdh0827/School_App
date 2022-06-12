//
//  ErrorView.swift
//  location service
//
//  Created by 임도협 on 6/8/22.
//

import SwiftUI

struct ErrorView: View {
    var errorText: String
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea(.all)
            
            VStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding(20)
                    .foregroundColor(.white)
                    .background(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text(errorText)
                    .padding(.top, 40)
                    .padding(.horizontal, 30)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
            }
        }
    }
}
