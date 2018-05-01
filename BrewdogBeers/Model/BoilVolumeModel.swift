//
//  BoilVolumeModel.swift
//  BrewdogBeers
//
//  Created by 李祺 on 01/05/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation
import ObjectMapper

class BoilVolume:Mappable {
    
    
    var value: Double?
    var unit: String?
    
    required init?(map: Map) {
        
    }
    
    init(value: Double, unit: String) {
        self.value = value
        self.unit = unit
    }
    
    
    
    func mapping(map: Map) {
        self.value <- map["value"]
        self.unit <- map["unit"]
    }
}
