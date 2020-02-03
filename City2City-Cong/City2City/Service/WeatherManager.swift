//
//  WeatherManager.swift
//  City2City
//
//  Created by Consultants on 2/01/20.
//  Copyright © 2020 mac. All rights reserved.
//


import Foundation
/* Singleton
Single instance of an object
Final keyword - does not allow inheritance
Static shared Instacne - Forces everyon to go through the shared instance

*/


// only one object is responsible for network call


typealias WeatherHandler = (Weather?, Error?) -> Void

let weatherService = WeatherManager.shared


enum CustomError: Error {
    case badUrl(String)
}

final class WeatherManager {
    
    //MARK: Properties
    static let shared = WeatherManager()
    private init() {}
    
    
    //MARK: Functions
    func getWeather(from city: City, completion: @escaping WeatherHandler) {
        
        let urlString = WeatherAPI.getWeatherURL(from: city)
        
        guard let url = URL(string: urlString) else {
            completion(nil, CustomError.badUrl("Could not receive data from URL"))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dat, _, err) in
            
            if let error = err {
                print("Bad Data: \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            
            if let data = dat {
                
                do {
                    
                    let weather = try JSONDecoder().decode(Weather.self, from: data)
                    completion(weather, nil)
                    
                } catch let yellow {
                    print("Could Not Decode Object: \(yellow.localizedDescription)")
                    completion(nil, yellow)
                }
                
            }
        }.resume()
        
        
    }
    
    

}
