//
//  PaymentService.swift
//  StripeExample
//
//  Created by Xavier Sotomayor on 6/9/24.
//

import Foundation
import Alamofire

struct PaymentService {
    
    private static let API_ENDPOINT = AppConstants.ENDPOINT
    
    static func getSubscriptionToken(amount: Int, callback: PaymentResponseProtocol){
        
        AF.request("\(API_ENDPOINT)/\(AppConstants.CHECKOUT)/\(amount)", method: .get).responseDecodable(of: PaymentResponse.self){response in
            
            guard let result  = response.value else {
                
                callback.onError(message: response.error?.errorDescription ?? AppConstants.ERROR)
                return
            }
            
            callback.onResult(result: result)
        }
    }
    
}

