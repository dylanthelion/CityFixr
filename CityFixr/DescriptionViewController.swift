//
//  DescriptionViewController.swift
//  CityFixr
//
//  Created by Dylan on 7/21/15.
//  Copyright (c) 2015 Dylan. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var descriptionTextView: UITextView!
    
    let issueManager = IssueManager.appIssueManager
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
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
