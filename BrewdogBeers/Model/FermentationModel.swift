//
//  FermentationModel.swift
//  BrewdogBeers
//
//  Created by 李祺 on 01/05/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation
import ObjectMapper

class Fermentation:Mappable {
    
    
    var temp: BoilVolume?
    
    init(temp: BoilVolume) {
        self.temp = temp
    }
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.temp <- map["temp"]
        
    }
}
