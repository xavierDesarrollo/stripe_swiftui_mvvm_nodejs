//
//  PaymentResponse.swift
//  StripeExample
//
//  Created by Xavier Sotomayor on 6/9/24.
//

import Foundation

struct PaymentResponse : Decodable{
    
    let paymentIntent: String
    let publishableKey: String
    let customer: String
    let ephemeralKey: String
    
    enum CodingKeys: String, CodingKey {
        case paymentIntent
        case publishableKey
        case customer
        case ephemeralKey
    }
    
}

