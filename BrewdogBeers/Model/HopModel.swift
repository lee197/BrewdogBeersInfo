//
//  HopModel.swift
//  BrewdogBeers
//
//  Created by 李祺 on 01/05/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation
import ObjectMapper

enum State {
    case IDLE
    case DONE
    
}


class Hop:Mappable {
    
    
    var name: String?
    var amount: BoilVolume?
    var add: String?
    var attribute: String?
    var state:State=State.IDLE // this is the state for button tap
    
    init(name: String, amount: BoilVolume, add: String, attribute: String,state: State) {
        self.name = name
        self.amount = amount
        self.add = add
        self.attribute = attribute
        self.state = state
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.name <- map["name"]
        self.amount <- map["amount"]
        self.add <- map["add"]
        self.attribute <- map["attribute"]
        
    }
}
