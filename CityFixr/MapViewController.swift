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

    override func viewDidLoad() {
        super.viewDidLoad()
        buildMap(CLLocationCoordinate2DMake(45.0, -83.0))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildMap(center : CLLocationCoordinate2D) {
        let camera = GMSCameraPosition.cameraWithLatitude(center.latitude, longitude: center.longitude, zoom: 10)
        
        let myMapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        myMapView.delegate = self
        myMapView.myLocationEnabled = true
        myMapView.frame = mapContainerView.frame
        view.addSubview(myMapView)
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
