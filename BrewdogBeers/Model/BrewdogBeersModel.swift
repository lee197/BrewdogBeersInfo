//
//  BrewdogBeersModel.swift
//  BrewdogBeers
//
//  Created by 李祺 on 27/04/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation
import ObjectMapper


class BrewdogBeersModel:Mappable {
   
    
    var id: Int?
    var name, tagline, firstBrewed, description: String?
    var imageURL: String?
    var abv: Double?
    var ibu: Double?
    var targetFg: Int?
    var targetOg: Double?
    var ebc: Int?
    var srm, ph: Double?
    var attenuationLevel: Double?
    var volume, boilVolume: BoilVolume?
    var method: Method?
    var ingredients: Ingredients?
    var foodPairing: [String]?
    var brewersTips: String?
    var contributedBy: String?
    
    required init?(map: Map) {
        
    }
    
    init(id: Int, name: String, tagline: String, firstBrewed: String, description: String, imageURL: String, abv: Double, ibu: Double?, targetFg: Int, targetOg: Double, ebc: Int?, srm: Double?, ph: Double?, attenuationLevel: Double, volume: BoilVolume, boilVolume: BoilVolume, method: Method, ingredients: Ingredients, foodPairing: [String], brewersTips: String, contributedBy: String) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.firstBrewed = firstBrewed
        self.description = description
        self.imageURL = imageURL
        self.abv = abv
        self.ibu = ibu
        self.targetFg = targetFg
        self.targetOg = targetOg
        self.ebc = ebc
        self.srm = srm
        self.ph = ph
        self.attenuationLevel = attenuationLevel
        self.volume = volume
        self.boilVolume = boilVolume
        self.method = method
        self.ingredients = ingredients
        self.foodPairing = foodPairing
        self.brewersTips = brewersTips
        self.contributedBy = contributedBy
    }
  
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
        self.tagline <- map["tagline"]
        self.firstBrewed <- map["first_brewed"]
        self.description <- map["description"]
        self.imageURL <- map["image_url"]
        self.abv <- map["abv"]
        self.ibu <- map["ibu"]
        self.targetFg <- map["target_fg"]
        self.targetOg <- map["target_og"]
        self.ebc <- map["ebc"]
        self.srm <- map["srm"]
        self.ph <- map["ph"]
        self.attenuationLevel <- map["attenuation_level"]
        self.volume <- map["volume"]
        self.boilVolume <- map["boil_volume"]
        self.method <- map["method"]
        self.ingredients <- map["ingredients"]
        self.foodPairing <- map["food_pairing"]
        self.brewersTips <- map["brewers_tips"]
        self.contributedBy <- map["contributed_by"]
    }

}













