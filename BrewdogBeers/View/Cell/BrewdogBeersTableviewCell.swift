//
//  BrewdogBeersTableviewCell.swift
//  BrewdogBeers
//
//  Created by 李祺 on 28/04/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class BrewdogBeersTableviewCell: UITableViewCell{
    
    @IBOutlet weak var beerImage: UIImageView!
    
    
    @IBOutlet weak var beerNameLabel: UILabel!
    
    @IBOutlet weak var beerDescriptionLabel: UILabel!
    
    @IBOutlet weak var abvLabel: UILabel!
    
    
    override func awakeFromNib() {
    
    }
    
    
    func getBeerImage(urlString:String){
        
        let url = NSURL(string: urlString)!;
        
        
        self.beerImage.af_setImage(withURL: url as URL, placeholderImage: nil, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(1), runImageTransitionIfCached: true, completion: { (response) in
            
            
            if (response.error == nil) {
                
                
       
                
                
                return
                
            }
            
            
        })
    }
    
}
