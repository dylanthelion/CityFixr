//
//  Models.swift
//  CityFixr
//
//  Created by Dylan on 7/21/15.
//  Copyright (c) 2015 Dylan. All rights reserved.
//

import Foundation
import CoreLocation

enum Issues : Int {
    
    case First = 0
    case Second = 1
    
    // Is there a better way to do this? If the count is high, there will be a nil access error in the issues table.
    
    static var count : Int {
        return 2
    }
    
    static var stringValues : [String] {
        return ["First", "Second"]
    }
}

class Issue {
    
    init() {
        
    }
    
    var issueType : Issues?
    var location : CLLocationCoordinate2D?
    
    
}