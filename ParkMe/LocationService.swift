//
//  LocationService.swift
//  ParkMe
//
//  Created by Boxuan Zhu on 6/1/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import Foundation
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate{
    static let instance = LocationService()
    
    var locationManager = CLLocationManager()
    var curretLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = 50
        self.locationManager.stopUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.curretLocation = locationManager.location?.coordinate
    }
}
