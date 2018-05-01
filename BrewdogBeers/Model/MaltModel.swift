//
//  MaltModel.swift
//  BrewdogBeers
//
//  Created by 李祺 on 01/05/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation
import ObjectMapper

class Malt:Mappable {
    
    
    var name: String?
    var amount: BoilVolume?
    var state:State=State.IDLE // this is the state for button tap
    
    init(name: String, amount: BoilVolume,state: State) {
        self.name = name
        self.amount = amount
        self.state = state
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.name <- map["name"]
        self.amount <- map["amount"]
    }
}
