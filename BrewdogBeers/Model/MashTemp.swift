//
//  MashTemp.swift
//  BrewdogBeers
//
//  Created by 李祺 on 01/05/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation
import ObjectMapper

enum MethodState {
    
    case IDLE
    case RUNNING
    case PAUSE
    case DONE
    
}

class MashTemp:Mappable {
    
    
    var temp: BoilVolume?
    var duration: Int?
    var methodState:MethodState=MethodState.IDLE // this is the state for method button tap
    var countDownDuration: Int? // duration to be deducted when timer started.
    init(temp: BoilVolume, duration: Int?,methodState: MethodState) {
        self.temp = temp
        self.duration = duration
        self.methodState = methodState
        self.countDownDuration = duration
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.temp <- map["temp"]
        self.duration <- map["duration"]
        self.countDownDuration <- map["duration"]
        
        
    }
}
