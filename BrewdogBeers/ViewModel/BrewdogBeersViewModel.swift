//
//  BrewdogBeersViewModel.swift
//  BrewdogBeers
//
//  Created by 李祺 on 27/04/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation


class BrewdogBeersViewModel:NSObject{
    
    @IBOutlet var beersInfoClient:BeersInfoClient!
    
    private var brewdogBeersModelArray=[BrewdogBeersModel]()
    
    
    /**
     request the data from API
     
     - parameter: completion:@escaping (String)->() a call back function to do extra steps for the UI, for example: reload tableView
     
     - returns: Void
     */
    
    public func fetchData(completion:@escaping (String?)->()) {
        
        beersInfoClient.requestBeerData{ brewdogBeersModel,errorString  in
            
            if brewdogBeersModel==nil{
                
                completion(errorString!)
                
                
            }else{
                
                self.brewdogBeersModelArray = brewdogBeersModel!
                completion(nil)
            }
            
            
        }
        
    }
    
    /**
     return the number of rows in tableView
     
     - parameter: void
     
     - returns: the number of rows
     */
    
    func numberOfRowsInTableViewSection()->Int{
        
        
        return brewdogBeersModelArray.count
        
    }
    
    /**
     return the image URL String for a imageView in the specific cell
     
     - parameter: the indexPath of tableView Cell
     
     - returns: image URL String
     */
    
    func getImageString(indexPath:IndexPath)->String{
        
        
        let productString = brewdogBeersModelArray[indexPath.row].imageURL
        
        return productString ?? "nothing"
        
        
        
        
    }
    
    /**
     return the beer name to the name label in the specific cell
     
     - parameter: the indexPath of tableView Cell
     
     - returns: beer name string
     */
    
    func getBeerName(indexPath:IndexPath)->String{
        
        
        return brewdogBeersModelArray[indexPath.row].name ?? "nothing"
        
        
    }
    
    /**
     return the beer description to the description label in the specific cell
     
     - parameter: the indexPath of tableView Cell
     
     - returns: beer description string
     */
    
    func getBeerDescription(indexPath:IndexPath)->String{
        
        
        return brewdogBeersModelArray[indexPath.row].description ?? "nothing"
        
    }
    
    /**
     return the beer abv to the abv label in the specific cell
     
     - parameter: the indexPath of tableView Cell
     
     - returns: beer abv
     */
    
    func getBeerAbv(indexPath:IndexPath)->Double{
        
        
        return brewdogBeersModelArray[indexPath.row].abv ?? 0.0
        
    }
    
    /**
     return the specific beer model from the beer model array
     
     - parameter: the indexPath of tableView Cell
     
     - returns: beer model
     */
    
    
    func getTheSelectedBeerInfo(indexPath:IndexPath)->BrewdogBeersModel{
        
        return brewdogBeersModelArray[indexPath.row]
        
    }
    
    
}
