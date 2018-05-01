//
//  ViewController.swift
//  BrewdogBeers
//
//  Created by 李祺 on 27/04/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import UIKit
import Moya
import ObjectMapper

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var brewdogBeersViewModel: BrewdogBeersViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.rowHeight = 186
        
        
        brewdogBeersViewModel.fetchData{ errorString in
            
            if errorString==nil{
                
                self.tableView.reloadData()
                
                
            }else{
                
                let alert = UIAlertController(title: "Alert", message: errorString, preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                
                
            }
            
            
        }
        
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brewdogBeersViewModel.numberOfRowsInTableViewSection()
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BrewdogBeersTableviewCell
        
        cell.getBeerImage(urlString: brewdogBeersViewModel.getImageString(indexPath: indexPath))
        cell.beerNameLabel.text = brewdogBeersViewModel.getBeerName(indexPath: indexPath)
        cell.beerDescriptionLabel.text=brewdogBeersViewModel.getBeerDescription(indexPath: indexPath)
        cell.abvLabel.text=String(brewdogBeersViewModel.getBeerAbv(indexPath: indexPath))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath:IndexPath = self.tableView.indexPathForSelectedRow!
        
        let brewdogBeersDetailViewController = segue.destination as! BrewdogBeersDetailViewController
        
        brewdogBeersDetailViewController.brewdogBeersDetailViewModel = BrewdogBeersDetailViewModel.init(brewdogBeersModel: brewdogBeersViewModel.getTheSelectedBeerInfo(indexPath: indexPath))
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

