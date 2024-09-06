//
//  CheckoutView.swift
//  StripeExample
//
//  Created by Xavier Sotomayor on 6/9/24.
//

import SwiftUI
import Stripe
import StripePaymentSheet

struct CheckoutView: View {
    
    @StateObject var viewModel: PaymentViewModel
    
    var body: some View {
        
        VStack{
            Text(AppConstants.ORDER).font(.headline).fontWeight(.bold).frame(maxWidth: .infinity,alignment: .leading).padding(.leading)
            ZStack{
                HStack{
                    Image(systemName: AppConstants.PHOTO).resizable().colorInvert().background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(Utils.getColor("#FF8181")).frame(width: 90, height: 80, alignment: .leading)).frame(width: 40, height: 40).padding()
                    VStack(alignment: .leading, spacing: 8) {
                        Text(AppConstants.TITLE).font(.headline)
                        Text(AppConstants.DESCRIPTION).font(.subheadline).fontWeight(.semibold).opacity(0.8)
                        Text("$\(self.viewModel.amount/100).00").font(.subheadline).fontWeight(.semibold).opacity(0.8).foregroundColor(.red)
                        HStack {
                            Button{
                                self.viewModel.calculateAmount(value: 1)
                            }
                            label: {
                                Text("+")
                            }
                            Text("\(self.viewModel.value)")
                            Button{
                                self.viewModel.calculateAmount(value: 0)
                            }
                            label: {
                                Text("-")
                            }
                        }
                    }.padding()
                }.frame(maxWidth: .infinity, alignment: .leading).padding([.leading, .trailing])
            }.background( RoundedRectangle(cornerRadius: 25.0).foregroundColor(Utils.getColor("#E6E6FF"))).padding([.leading, .trailing])
            if viewModel.paymentSheet != nil {
                PaymentSheet.PaymentButton(
                    paymentSheet: viewModel.paymentSheet!,
                    onCompletion: viewModel.onPaymentCompletion
                ) {
                    Button(action: {}, label: {
                        Text(AppConstants.PAY).foregroundColor(.white)
                    }).frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15.0).foregroundColor(.blue))
                    .frame(maxWidth: .infinity)
                    .padding().disabled(true)
                }
            } else {
                Button(action: {}, label: {
                    Text(AppConstants.PAY).foregroundColor(.white)
                }).frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15.0).foregroundColor(.gray))
                .frame(maxWidth: .infinity)
                .padding().disabled(true)
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(viewModel: PaymentViewModel())
    }
}
