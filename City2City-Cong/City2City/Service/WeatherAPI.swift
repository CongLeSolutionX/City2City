//
//  WeatherAPI.swift
//  City2City
//
//  Created by Consultants on 2/01/20.
//  Copyright © 2020 mac. All rights reserved.
//


import Foundation
import CoreLocation

struct WeatherAPI {
    
    
    static let base = "https://api.openweathermap.org/data/2.5/weather?"
    static let key = "&APPID=7cdcd7f9a8620c069b7159b27a5f7a34&units=imperial"
    
    static func getWeatherURL(from city: City) -> String {
        
        let coordinates = "lat=\(city.coordinates.latitude)&lon=\(city.coordinates.longitude)"
        return base + coordinates + key
        
    }
    
}
