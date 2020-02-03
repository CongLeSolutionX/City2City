//
//  City.swift
//  City2City
//
//  Created by Consultants on 2/01/20.
//  Copyright © 2020 mac. All rights reserved.
//


import Foundation
import CoreLocation

enum SerializationError: Error {
    case missingProperty(String)
}


class City {
    
    let name: String
    let coordinates: CLLocationCoordinate2D
    let state: String
    let population: String
    
    init?(json: [String:Any]) throws {
        
        guard let city = json["city"] as? String,
            let longitude = json["longitude"] as? Double,
            let latitude = json["latitude"] as? Double,
            let state = json["state"] as? String,
            let population = json["population"] as? String else {
            throw SerializationError.missingProperty("Could not serialize JSON")
        }
        
        self.name = city
        self.coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.state = state
        
        self.population = population
        

    }
    
    init(with core: CoreCity) {
        
        self.name = core.name!
        self.coordinates = CLLocationCoordinate2D(latitude: core.latitude, longitude: core.longitude)
        self.population = core.population!
        self.state = core.state!
      
    }
    
    
    
}
