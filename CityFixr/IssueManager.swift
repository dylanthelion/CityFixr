//
//  IssueManager.swift
//  CityFixr
//
//  Created by Dylan on 7/21/15.
//  Copyright (c) 2015 Dylan. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

private let globalManager = IssueManager()

class IssueManager {
    
    var issue = Issue()
    
    init() {
        
    }
    
    class var appIssueManager : IssueManager {
        return globalManager
    }
    
    func buildJSONObject() -> Dictionary<String, AnyObject> {
        
        var dictionaryToReturn = Dictionary<String, AnyObject>()
        return dictionaryToReturn
    }
}