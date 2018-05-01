//
//  MethodModel.swift
//  BrewdogBeers
//
//  Created by 李祺 on 01/05/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation
import ObjectMapper



class Method:Mappable {
    
    
    var mashTemp: [MashTemp]?
    var fermentation: Fermentation?
    var twist: String?
    
    init(mashTemp: [MashTemp], fermentation: Fermentation, twist: String?) {
        self.mashTemp = mashTemp
        self.fermentation = fermentation
        self.twist = twist
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.mashTemp <- map["mash_temp"]
        self.fermentation <- map["fermentation"]
        self.twist <- map["twist"]
    }
}
