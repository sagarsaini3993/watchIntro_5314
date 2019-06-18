//
//  ViewController.swift
//  WatchIntro
//
//  Created by MacStudent on 2019-06-18.
//  Copyright © 2019 sagar. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    
    //MARK:- WCSessionDelegate functions
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
        
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
    

    @IBOutlet weak var lblOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // check if phone supports WCSession
        if WCSession.isSupported() {
            print("Yes it is")
            
            let session = WCSession.default
            session.delegate = self
            session.activate()
        } else {
            print("PHONE: Phone doesnt support session")
        }
        
    }

    @IBAction func btnPressed(_ sender: Any) {
        
        print("Hello you pushed the btn")
        lblOutput.text = "hnziii"
        
        // check if the watch is paired / accessible
        if (WCSession.default.isReachable) {
            // construct the message you want to send
            // the message is in dictionary
            let message = ["name": "Sagar"]
            // send the message to the watch
            WCSession.default.sendMessage(message, replyHandler: nil)
            
            print("Phone : Sent the data")
            self.lblOutput.text = "Message sent"
        } else {
            print("Cannot find the watch")
            self.lblOutput.text = "Error: Cannot find watch"
        }

        
        
    }
    
}

