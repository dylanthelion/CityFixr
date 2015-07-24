//
//  IssueViewController.swift
//  CityFixr
//
//  Created by Dylan on 7/21/15.
//  Copyright (c) 2015 Dylan. All rights reserved.
//

import UIKit

class IssueViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var issuesTable: UITableView!
    
    @IBOutlet weak var issueLabel: UILabel!
    
    let cellLabels : [String] = Issues.stringValues
    var didSelect : Bool = false
    let issueManager = IssueManager.appIssueManager
    var selectedIssue : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "issueCell")
        cell.textLabel?.text = cellLabels[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        issueLabel.text = cellLabels[indexPath.row]
        selectedIssue = indexPath.row
        didSelect = true
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Issues.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        
        if(identifier! == "addDescription" || identifier! == "addPhoto") {
            
            if(didSelect == false) {
                let alertController = UIAlertController(title: "Error", message: "Please select an issue type. If your issue is not included here, you can reach us at: dillion256@gmail.com", preferredStyle: .Alert)
                let dismissAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(dismissAction)
                self.presentViewController(alertController, animated: true, completion: nil)
                return false
            }
            
            issueManager.issue.issueType = Issues(rawValue: selectedIssue!)
            return true
        }
        
        return true
    }
    
    @IBAction func submit(sender: AnyObject) {
        
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
