//
//  LoginViewController.swift
//  CityFixr
//
//  Created by Dylan on 7/20/15.
//  Copyright (c) 2015 Dylan. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import CoreLocation

class LoginViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = GlobalLocationManager.appLocationManager

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.startLocating(self)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        
        if(identifier! == "showMap" && FBSDKAccessToken.currentAccessToken() == nil) {
            return false
        }
        
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
