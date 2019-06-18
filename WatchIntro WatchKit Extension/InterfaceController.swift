//
//  InterfaceController.swift
//  WatchIntro WatchKit Extension
//
//  Created by MacStudent on 2019-06-18.
//  Copyright © 2019 sagar. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
        
        
    }
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
        // OPEN THE MESSAGE
        print("NAME: \(String(describing: message["name"])))")
        self.lblOutput.setText("\(String(describing: message["name"]!))")
        
    }
    

    @IBOutlet weak var lblOutput: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        print("Watch app is loaded!")
        
        // check if watch supports WCSession
        if (WCSession.isSupported()) {
            print("WATCH: Yes it supports session!")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        } else {
            print("WATCH : No, it doesnt support session")
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    var flipMsgs = true

    @IBAction func btnPressed() {
        print("btn pressed")
        lblOutput.setText("heloooo hnziiii")
        
        if flipMsgs == true {
            lblOutput.setText("HELLLOOOO")
            flipMsgs = false
        } else if flipMsgs == false {
            lblOutput.setText("GOODBYE")
            flipMsgs = true
        }
    }
}
