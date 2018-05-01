//
//  BrewdogBeersDetailViewModel.swift
//  BrewdogBeers
//
//  Created by 李祺 on 30/04/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation


class BrewdogBeersDetailViewModel{
    
    private var brewdogBeersModel:BrewdogBeersModel?
    
    
    public init(brewdogBeersModel:BrewdogBeersModel) {
        self.brewdogBeersModel = brewdogBeersModel
    }
    
    /**
     return the image URL String for imageView
     
     - parameter: void
     
     - returns: image URL String
     */
    
    func getImageURLString()->String{
        
        let productString = brewdogBeersModel!.imageURL
        
        return productString ?? "nothing"
        
        
    }
    
    /**
     return beer info array to show on the BrewdogBeersDetailViewController
     
     - parameter: void
     
     - returns: an array with beer name , beer description, beer abv
     */
    
    func getBeerInfo()->[String]{
        
        return [brewdogBeersModel!.name ?? "nothing",brewdogBeersModel!.description ?? "nothing",String(brewdogBeersModel!.abv ?? 0.0)]
        
    }
    
    /**
     return the processing titles
     
     - parameter: void
     
     - returns: an array to display all methods, malts, hops
     */
    
    func getBeerProcessingInfo()->[String]{
        
        return [ "Display all methods","Display all malts","Display all hops"
        ]
        
    }
    
    /**
     return the brewdogBeersModel
     
     - parameter: void
     
     - returns: brewdogBeersModel
     */
    
    func getBrewdogBeersModel()->BrewdogBeersModel{
        
        return brewdogBeersModel!
        
    }
    
}
