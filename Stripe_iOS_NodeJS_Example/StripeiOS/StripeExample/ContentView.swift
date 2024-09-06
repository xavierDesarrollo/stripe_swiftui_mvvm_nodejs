//
//  ContentView.swift
//  StripeExample
//
//  Created by Xavier Sotomayor on 4/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PaymentViewModel()
    
    var body: some View {
        
        VStack{
            
            if !viewModel.errorMessage && !viewModel.isSuccessPayment {
    
                LoadingView()
                
            } else if viewModel.errorMessage && !viewModel.isSuccessPayment {
                
                ErrorView(viewModel: self.viewModel)
                
            } else {
                
                CheckoutView(viewModel: self.viewModel)
                
            }
            
        }.onAppear{
            
            self.viewModel.tokenization()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
