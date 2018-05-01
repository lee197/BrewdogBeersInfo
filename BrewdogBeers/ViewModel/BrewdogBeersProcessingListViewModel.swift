//
//  BrewdogBeersProcessingListViewController.swift
//  BrewdogBeers
//
//  Created by 李祺 on 30/04/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import Foundation

class BrewdogBeersProcessingListViewModel{
    
    private var brewdogBeersModel:BrewdogBeersModel?
    
    // indexPath decides which section should use for the list, the secions include: method(indexPath?.row==4), malts (indexPath?.row==5), hops (indexPath?.row==6)
    private var indexPath:IndexPath?
    
    var timer = Timer()
    
    public init(brewdogBeersModel:BrewdogBeersModel,indexPath:IndexPath) {
        self.brewdogBeersModel = brewdogBeersModel
        self.indexPath = indexPath
    }
    /**
     return the number of rows according to the indexPath from the BrewdogBeersDetailViewController
     
     - parameter: void
     
     - returns: number of rows in tableView
     */
    
    func numberOfRowsInTableViewSection()->Int{
        
        if indexPath?.row==4{
            
            //return methods info
            
            return (brewdogBeersModel?.method?.mashTemp?.count)!
            
        }else if indexPath?.row==5 {
            
            //return malts info
            
            return (brewdogBeersModel?.ingredients?.malt!.count)!
            
        }else{
            
            //return hops info
            
            return (brewdogBeersModel?.ingredients?.hops?.count)!
            
        }
        
    }
    
    /**
     return processing names according to the indexPath from the BrewdogBeersDetailViewController
     
     - parameter: the indexPath of tableView Cell
     
     - returns: name string
     */
    
    func getProcessName(indexPath:IndexPath)->String{
        
        if self.indexPath?.row==4{
            
            //return methods info, if the duration is nil, return temperature, otherwise return temperature with specific seconds
            
            if brewdogBeersModel?.method?.mashTemp![indexPath.row].duration != 0 && brewdogBeersModel?.method?.mashTemp![indexPath.row].duration != nil{
                
                let duration = (brewdogBeersModel?.method?.mashTemp![indexPath.row].duration)!
                
                return "temperature with duration: "+String(duration) + " seconds"
                
            }else{
                
                return "temperature"
                
            }
            
            
        }else if self.indexPath?.row==5 {
            
            //return malts info
            
            return (brewdogBeersModel?.ingredients?.malt![indexPath.row].name)!
            
        }else{
            
            //return hops info
            
            return (brewdogBeersModel?.ingredients?.hops?[indexPath.row].name)!
            
        }
        
        
    }
    
    
    /**
     return processing temperature according to the indexPath from the BrewdogBeersDetailViewController
     
     - parameter: the indexPath of tableView Cell
     
     - returns: temperature string
     */
    
    func getProcessTemp(indexPath:IndexPath)->String{
        
        if self.indexPath?.row==4{
            
            //return methods info
            
            return String(format:"%.2f",(brewdogBeersModel?.method?.mashTemp?[indexPath.row].temp?.value!)!) + " " + (brewdogBeersModel?.method?.mashTemp?[indexPath.row].temp?.unit)!
            
        }else if self.indexPath?.row==5 {
            
            //return malts info
            
            return String(format:"%.2f",(brewdogBeersModel?.ingredients?.malt![indexPath.row].amount?.value)!)+" "+(brewdogBeersModel?.ingredients?.malt![indexPath.row].amount?.unit)!
        }else{
            
            //return hops info
            
            return String(format:"%.2f",(brewdogBeersModel?.ingredients?.hops![indexPath.row].amount?.value)!)+" "+(brewdogBeersModel?.ingredients?.hops![indexPath.row].amount?.unit)!
        }
        
    }
    /**
     return any extra inforamtion according to the indexPath from the BrewdogBeersDetailViewController if needed, for example, in method section, the extra info is "Time left", in hops section, the extra info is "add"
     
     - parameter: the indexPath of tableView Cell
     
     - returns: extra information
     */
    
    func getExtraInfo(indexPath:IndexPath)->String{
        
        if self.indexPath?.row==4{
            
            //return methods info, if the duration is nil, no inforamtion on show, otherwise show "Time left" with seconds
            
            if brewdogBeersModel?.method?.mashTemp![indexPath.row].duration == nil{
                
                return ""
                
            }else{
                
                let countDownDuration = (brewdogBeersModel?.method?.mashTemp![indexPath.row].countDownDuration)!
                
                
                return "Time left: "+String(countDownDuration)+" seconds"
                
            }
            
            
        }else if self.indexPath?.row==5 {
            
            //return malts info
            
            return ""
            
            
        }else{
            
            //return hops info
            
            return "add: "+(brewdogBeersModel?.ingredients?.hops![indexPath.row].add)!
            
            
        }
        
    }
    
    /**
     return title string according to the indexPath from the BrewdogBeersDetailViewController
     
     - parameter: the indexPath of tableView Cell
     
     - returns: title string
     */
    
    func getTitleonVC()->String{
        
        
        if self.indexPath?.row==4{
            
            //return methods info
            
            return "Methods"
            
            
        }else if self.indexPath?.row==5 {
            
            //return malts info
            
            return "Malts"
            
        }else{
            
            //return hops info
            
            return "Hops"
            
            
        }
    }
    
    /**
     return button state according to the indexPath from the BrewdogBeersDetailViewController
     
     - parameter: the indexPath of tableView Cell
     
     - returns: button state string
     */
    
    
    func setButtonState(indexPath:IndexPath)->String{
        
        if self.indexPath?.row==4{
            
            //return methods info
            
            switch brewdogBeersModel?.method?.mashTemp![indexPath.row].methodState {
                
                
            case .IDLE?:
                
                return "IDLE"
                
            case .DONE?:
                
                return "DONE"
                
            case .RUNNING?:
                
                return "RUNNING"
            case .PAUSE?:
                
                return "PAUSE"
                
            default:
                
                return "IDLE"
                
            }
            
            
            
            
        }else if self.indexPath?.row==5 {
            
            //return malts info
            switch  brewdogBeersModel?.ingredients?.malt![indexPath.row].state{
                
                
            case .IDLE?:
                
                return "IDLE"
                
            case .DONE?:
                
                return "DONE"
                
            default:
                return "IDLE"
                
            }
            
        }else{
            
            //return hops info
            
            
            switch brewdogBeersModel?.ingredients?.hops![indexPath.row].state{
                
                
            case .IDLE?:
                
                return "IDLE"
                
            case .DONE?:
                
                return "DONE"
                
            default:
                
                return "IDLE"
                
            }
            
        }
        
    }
    
    /**
     Handle the button click events
     
     - parameter: senderID(the tag of the button user clicked), currentTitle(the current button title),completion(the call back function to do extra actions in view controller)
     
     - returns: void
     */
    
    func buttonEventHandling(senderID:Int,currentTitle:String,completion:@escaping ()->()){
        
        
        if self.indexPath?.row==4{
            
            // In the metod section, if the duration is nil , just return 2 states: IDLE,DONE,otherwise,return 4 states and execute the timer
            
            if brewdogBeersModel?.method?.mashTemp![senderID].duration == nil{
                
                switch currentTitle {
                case "IDLE":
                    brewdogBeersModel?.method?.mashTemp![senderID].methodState = .DONE
                    
                case "DONE":
                    brewdogBeersModel?.method?.mashTemp![senderID].methodState = .IDLE
                    
                default:
                    brewdogBeersModel?.method?.mashTemp![senderID].methodState = .IDLE
                }
            }else{
                
                switch currentTitle {
                case "IDLE":
                    
                    brewdogBeersModel?.method?.mashTemp![senderID].methodState = .RUNNING
                    runTimer(senderID: senderID) // when user click IDLE button button button state change from IDLE to RUNNING, start the timer
                    
                case "RUNNING":
                    
                    brewdogBeersModel?.method?.mashTemp![senderID].methodState = .PAUSE
                    timer.invalidate() // when user click RUNNING button button button state change from RUNNING to PAUSE, pause the timer
                    
                case "PAUSE":
                    
                    brewdogBeersModel?.method?.mashTemp![senderID].methodState = .RUNNING
                    runTimer(senderID: senderID)// when user click PAUSE button button button state change from PAUSE to RUNNING, start the timer
                    
                case "DONE":
                    
                    // when user click DONE button button state change from DONE to IDEL, assign the original value back to countDuration to prepare the next count down.
                    
                    
                    brewdogBeersModel?.method?.mashTemp![senderID].countDownDuration = brewdogBeersModel?.method?.mashTemp![senderID].duration
                    brewdogBeersModel?.method?.mashTemp![senderID].methodState = .IDLE
                    
                default:
                    
                    // if the timer finish counting down, send the state back to here to update the button to DONE state
                    brewdogBeersModel?.method?.mashTemp![senderID].methodState = .DONE
                }
                
            }
            
        }else if self.indexPath?.row==5{
            
            if currentTitle == "IDLE"{
                
                brewdogBeersModel?.ingredients?.malt![senderID].state = .DONE
                
            }else{
                
                brewdogBeersModel?.ingredients?.malt![senderID].state = .IDLE
                
            }
            
        }else{
            // hops events
            if currentTitle == "IDLE"{
                
                brewdogBeersModel?.ingredients?.hops![senderID].state = .DONE
                
            }else{
                
                brewdogBeersModel?.ingredients?.hops![senderID].state = .IDLE
                
            }
            
        }
        
        completion() // execute this to reload the tableView
    }
    
    /**
     start the timer
     - parameter: senderID(the tag of the button user clicked)
     - returns: void
     */
    
    func runTimer(senderID:Int){
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(BrewdogBeersProcessingListViewModel.updateTimer(timer:))), userInfo: senderID, repeats: true)
        
        
        
    }
    
    /**
     update the timer every second when user clicked
     - parameter: timer with user Info
     - returns: void
     */
    
    @objc func updateTimer(timer:Timer){
        
        let info = timer.userInfo as! Int
        
        if (brewdogBeersModel?.method?.mashTemp![info].countDownDuration)! < 1{
            // if timer count down after 1, stop the timer and reload tableView to update relevant UI
            
            
            self.buttonEventHandling(senderID:info, currentTitle: "Timer Stop"){
                
                NotificationCenter.default.post(name: Notification.Name("reload"), object: nil, userInfo: nil)
                
            }
            
            timer.invalidate()
            
            
        }else{
            
            // if timer count down above 1,  deduct countDownDuration from 1 and reload tableView to update relevant UI
            
            
            brewdogBeersModel?.method?.mashTemp![info].countDownDuration = (brewdogBeersModel?.method?.mashTemp![info].countDownDuration)!-1
            NotificationCenter.default.post(name: Notification.Name("reload"), object: nil, userInfo: nil)
            
            
            
        }
    }
    
    
    
    
    
    
}
