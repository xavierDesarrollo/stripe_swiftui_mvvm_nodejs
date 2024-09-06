//
//  PaymentResponseProtocol.swift
//  StripeExample
//
//  Created by Xavier Sotomayor on 6/9/24.
//

import Foundation

protocol PaymentResponseProtocol {
    
    func onResult(result: PaymentResponse)
    func onError(message: String)
    
}
