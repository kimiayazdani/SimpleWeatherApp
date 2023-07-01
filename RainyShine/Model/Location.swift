//
//  Location.swift
//  RainyShine
//
//  Created by Kimia Yazdani on 6/28/23.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
