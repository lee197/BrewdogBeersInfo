//
//  IngredientsModel.swift
//  BrewdogBeers
//
//  Created by 李祺 on 01/05/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation
import ObjectMapper

class Ingredients:Mappable {
    
    
    var malt: [Malt]?
    var hops: [Hop]?
    var yeast: String?
    
    init(malt: [Malt], hops: [Hop], yeast: String) {
        self.malt = malt
        self.hops = hops
        self.yeast = yeast
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.malt <- map["malt"]
        self.hops <- map["hops"]
        self.yeast <- map["yeast"]
        
    }
}
