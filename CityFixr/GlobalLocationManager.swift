//
//  GlobalLocationManager.swift
//  CityFixr
//
//  Created by Dylan on 7/21/15.
//  Copyright (c) 2015 Dylan. All rights reserved.
//

import Foundation
import CoreLocation

private let globalManager = GlobalLocationManager()

class GlobalLocationManager : CLLocationManager {
    
    var currentLocation : CLLocation?
    
    var isLocating : Bool = false
    
    override init() {
         super.init()
    }
    
    class var appLocationManager : GlobalLocationManager {
        return globalManager
    }
    
    func startLocating(delegate : CLLocationManagerDelegate) {
        
        self.delegate = delegate
        
        if(!isLocating) {
            self.requestAlwaysAuthorization()
            self.desiredAccuracy = kCLLocationAccuracyBest
            self.startUpdatingLocation()
            isLocating = true
        }
    }
}