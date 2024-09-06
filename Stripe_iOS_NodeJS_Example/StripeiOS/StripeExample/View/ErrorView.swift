//
//  ErrorView.swift
//  StripeExample
//
//  Created by Xavier Sotomayor on 6/9/24.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    @State private var showSpinner:Bool = true
    @StateObject var viewModel: PaymentViewModel
    
    var body: some View {
        ZStack {
            VStack {
                Text(AppConstants.ERROR)
                Button{
                    viewModel.tokenization()
                }
                label: {
                    if #available(iOS 15.0, *) {
                        Text(AppConstants.TRY_AGAIN)
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .frame(width: 160)
                            .background(.linearGradient(colors: [.red,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(8)
                    } else { }
                    
                }
                .padding(20)
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(viewModel: PaymentViewModel())
    }
}


