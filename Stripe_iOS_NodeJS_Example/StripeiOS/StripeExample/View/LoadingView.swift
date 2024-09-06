//
//  LoadingView.swift
//  StripeExample
//
//  Created by Xavier Sotomayor on 6/9/24.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    @State private var degree:Int = 270
    @State private var spinnerLength = 0.6
    
    var body: some View {
        ZStack {
            VStack {
                Circle()
                    .trim(from: 0.0,to: spinnerLength)
                    .stroke(LinearGradient(colors: [.red,.blue], startPoint: .topLeading, endPoint: .bottomTrailing),style: StrokeStyle(lineWidth: 8.0,lineCap: .round,lineJoin:.round))
                    .animation(Animation.easeIn(duration: 1.5).repeatForever(autoreverses: true))
                    .frame(width: 60,height: 60)
                    .rotationEffect(Angle(degrees: Double(degree)))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .onAppear{
                        degree = 270 + 360
                        spinnerLength = 0
                    }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

