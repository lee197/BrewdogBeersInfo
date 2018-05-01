//
//  BeersInfoClient.swift
//  BrewdogBeers
//
//  Created by 李祺 on 28/04/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper



class BeersInfoClient:NSObject{
    
    
    func requestBeerData(completion: @escaping (Array<BrewdogBeersModel>?,_ errorString:String?)->())  {
        let provider = MoyaProvider<NetworkingManager>()
        
        provider.request(.beers) { result in
            
            
            switch result
            {
            case let .success(moyaResponse):
                do {
                    let data = try moyaResponse.mapJSON()
                    
                    let brewdogBeers = Mapper<BrewdogBeersModel>().mapArray(JSONArray: data as! [[String : Any]])
                    
                    completion(brewdogBeers,nil)
                    
                    return
                }catch {
                    
                    completion(nil,"unknown error")
                    
                    
                    return
                }
                
            case let .failure(error):
                
                
                completion(nil,error.errorDescription)
                
                break
            }
        }
    }
    
    
}
