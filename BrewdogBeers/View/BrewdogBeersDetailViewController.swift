//
//  BrewdogBeersDetailViewController.swift
//  BrewdogBeers
//
//  Created by 李祺 on 29/04/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation
import UIKit

class BrewdogBeersDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var brewdogBeersDetailViewModel: BrewdogBeersDetailViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 196
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let  cell = tableView.dequeueReusableCell(withIdentifier: "imageCell") as! BeerDetailImageCell
            
            cell.getBeerImage(urlString: (brewdogBeersDetailViewModel?.getImageURLString())!)
            cell.selectionStyle = .none;
            cell.isUserInteractionEnabled = false
            return cell
            
            
        }else if indexPath.row <= 3 && indexPath.row>0{
            
            let  cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as! BeerInfoCell
            
            cell.beerInfoLabel.text = brewdogBeersDetailViewModel?.getBeerInfo()[indexPath.row-1]
            cell.selectionStyle = .none;
            cell.isUserInteractionEnabled = false
            return cell
            
            
        }else{
            
            
            let  cell = tableView.dequeueReusableCell(withIdentifier: "listCell") as!BeerProcessMethodCell
            cell.beerProcessLabel.text = brewdogBeersDetailViewModel?.getBeerProcessingInfo()[indexPath.row-4]
            
            return cell
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let brewdogBeersProcessingListVC = segue.destination as! BrewdogBeersProcessingListVC
        let indexPath:IndexPath = self.tableView.indexPathForSelectedRow!
        
        brewdogBeersProcessingListVC.brewdogBeersProcessingListViewModel = BrewdogBeersProcessingListViewModel.init(brewdogBeersModel: (brewdogBeersDetailViewModel?.getBrewdogBeersModel())!, indexPath: indexPath)
        
    }
    
    
    
    
    
}
