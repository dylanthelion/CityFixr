//
//  MapViewController.swift
//  CityFixr
//
//  Created by Dylan on 7/20/15.
//  Copyright (c) 2015 Dylan. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate {
    
    @IBOutlet weak var mapContainerView: UIView!
    
    @IBOutlet weak var mapPin: UIImageView!
    
    let locationManager = GlobalLocationManager.appLocationManager
    let issueManager = IssueManager.appIssueManager
    
    var mapView : GMSMapView?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = locationManager.location {
            buildMap(locationManager.location!.coordinate)
        } else {
            print("Location not being updated in time. Construct proper error handling.")
            buildMap(CLLocationCoordinate2DMake(45.0, -83.0))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildMap(center : CLLocationCoordinate2D) {
        let camera = GMSCameraPosition.cameraWithLatitude(center.latitude, longitude: center.longitude, zoom: 15)
        
        let myMapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        myMapView.delegate = self
        myMapView.myLocationEnabled = false
        myMapView.frame = mapContainerView.frame
        view.addSubview(addPin(myMapView))
        view.bringSubviewToFront(mapPin)
        mapView = myMapView
    }
    
    func addPin(map: GMSMapView) -> GMSMapView {
        let pinFrame = mapPin.frame
        let pinToTop = UIImageView(frame: pinFrame)
        pinToTop.image = UIImage(named: "Pin")
        map.addSubview(pinToTop)
        mapPin.removeFromSuperview()
        return map
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        
        if(identifier! == "addIssue") {
            if let _ = locationManager.location, _ = mapView {
                let center = mapView?.center
                issueManager.issue.location = mapView!.projection.coordinateForPoint(center!)
                return true
            } else {
                return false
            }
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
