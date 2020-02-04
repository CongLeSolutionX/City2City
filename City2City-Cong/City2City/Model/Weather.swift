//
//  Weather.swift
//  City2City
//
//  Created by Consultants on 2/01/20.
//  Copyright © 2020 mac. All rights reserved.
//


import Foundation


class Weather: Decodable {
    
    
    let weather: [WeatherDetails]
    let main: Main
    let wind: Wind
    
}

struct WeatherDetails: Decodable {
    
    let description: String
    let icon: String
    
}

struct Main: Decodable {
    
    let temperature: Double
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case humidity
    }
    
}


struct Wind: Decodable {
    
    let speed: Double
    
}
