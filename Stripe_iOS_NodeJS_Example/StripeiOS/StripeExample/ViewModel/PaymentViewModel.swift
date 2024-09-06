//
//  PaymentViewModel.swift
//  StripeExample
//
//  Created by Xavier Sotomayor on 6/9/24.
//

import Foundation
import Stripe
import StripePaymentSheet
import UIKit

class PaymentViewModel: ObservableObject, PaymentResponseProtocol {
    
    @Published var paymentSheet: PaymentSheet?
    @Published var paymentResult: PaymentSheetResult?
    @Published var errorMessage: Bool = false
    @Published var isSuccessPayment: Bool = false
    @Published var amount:Int = 10000
    @Published var value:Int = 1
    var amountTemp: Int = 10000
    
    init() {
        STPAPIClient.shared.publishableKey = AppConstants.STRIPE_PUBLISHING_KEY
    }
    
    func tokenization() {
        errorMessage = false
        isSuccessPayment = false
        
        PaymentService.getSubscriptionToken(amount: amount, callback: self)
    }
    
    func calculateAmount(value: Int) {
        if value == 1 {
            self.value += 1
        } else if value == 0 {
            if self.value > 1 {
                self.value -= 1
            }
        } else {
            
        }
        self.amount = amountTemp * self.value
        self.tokenization()
    }
    
    func onResult(result: PaymentResponse) {
        self.isSuccessPayment = true
        
        var configuration = PaymentSheet.Configuration()
        configuration.merchantDisplayName = AppConstants.MERCHANT
        configuration.customer = .init(id: result.customer, ephemeralKeySecret: result.ephemeralKey)
        configuration.primaryButtonColor = UIColor.init(.blue)
        DispatchQueue.main.async {
            self.paymentSheet = PaymentSheet(paymentIntentClientSecret: result.paymentIntent, configuration: configuration)
        }
    }
    
    func onError(message: String) {
        self.errorMessage = true
    }
    
    func onPaymentCompletion(result: PaymentSheetResult?) {
          if let paymentFinal = result {
              switch paymentFinal {
              case .completed:
                  print("Payment success")
              case .failed(let error):
                  print("Payment failed: \(error.localizedDescription)")
                  self.errorMessage = true
              case .canceled:
                  print("Payment canceled")
              }
          }
      }
}

