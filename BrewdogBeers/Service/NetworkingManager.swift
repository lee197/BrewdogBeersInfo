//
//  NetworkingManager.swift
//  BrewdogBeers
//
//  Created by 李祺 on 27/04/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation
import Moya

enum NetworkingManager {
    
    case beers
    
}

// MARK: - TargetType Protocol Implementation
extension NetworkingManager: TargetType {
    
    //specify the url
    
    var baseURL: URL { return URL(string: "https://api.punkapi.com/v2/")! }
    
    
    var path: String {
        
        switch self {
            
        case .beers:
            return "/beers"
            
     
            
            
        }
    }
    
    //specified the method
    var method: Moya.Method {
        switch self {
        case .beers:
            return .get
            
        }
    }
    //include the parameters
    var task: Task {
        
        switch self {
            
        case .beers:
            return .requestPlain
            

            
        }
    }
    // this sample data is used for test
    var sampleData: Data {
        switch self {
            
        case .beers:
            
            
            return "".utf8Encoded

        }
    }
    
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
