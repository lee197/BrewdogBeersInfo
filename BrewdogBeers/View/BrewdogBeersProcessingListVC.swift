//
//  BrewdogBeersProcessingViewController.swift
//  BrewdogBeers
//
//  Created by 李祺 on 29/04/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation
import UIKit


class BrewdogBeersProcessingListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var brewdogBeersProcessingListViewModel: BrewdogBeersProcessingListViewModel?
    
    @IBAction func confirmButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        titleLabel.text = brewdogBeersProcessingListViewModel?.getTitleonVC()
        NotificationCenter.default.addObserver(self, selector: #selector(BrewdogBeersProcessingListVC.reloadTableview), name: Notification.Name("reload"), object: nil)
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (brewdogBeersProcessingListViewModel?.numberOfRowsInTableViewSection())!
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "cell") as!BeersProcessingCell
        
        cell.nameLabel.text=(brewdogBeersProcessingListViewModel?.getProcessName(indexPath: indexPath))!
        
        cell.tempLabel.text=(brewdogBeersProcessingListViewModel?.getProcessTemp(indexPath: indexPath))!
        
        cell.extraInfoLabel.text = (brewdogBeersProcessingListViewModel?.getExtraInfo(indexPath: indexPath))!
        cell.controlButton.setTitle(brewdogBeersProcessingListViewModel?.setButtonState(indexPath:indexPath), for: .normal)
        
        cell.controlButton.tag = indexPath.row
        
        cell.controlButton.addTarget(self, action:#selector(BrewdogBeersProcessingListVC.buttonClicked(sender:)), for: .touchUpInside)
        
        
        return cell
        
    }
    
    @objc func buttonClicked(sender:UIButton){
        
        brewdogBeersProcessingListViewModel?.buttonEventHandling(senderID: sender.tag, currentTitle: sender.currentTitle!){
            
            
            self.reloadTableview()
            
        }
        
    }
    
    @objc func reloadTableview(){
        
        
        self.tableView.reloadData()
        
    }
    
    
    
}



