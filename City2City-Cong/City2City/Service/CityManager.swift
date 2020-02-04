//
//  CityService.swift
//  City2City
//
//  Created by Consultants on 2/01/20.
//  Copyright © 2020 mac. All rights reserved.
//


import Foundation

typealias CityHandler = ([City]) -> Void

let cityManager = CityManager.shared

final class CityManager {
    
    //MARK: Properties
    static let shared = CityManager()
    private init() {}
    
    //MARK: Function
    func getCities(completion: @escaping CityHandler) {
        
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            
            //container
            var cities = [City]()
            
            if let path = Bundle.main.path(forResource: "cities", ofType: "json") {
                
                
                //creating URL
                let url = URL(fileURLWithPath: path)
                
                do {
                    //get contents from url
                    let data = try Data(contentsOf: url)
                    
                    //JSON Serialization
                    let cityJSON = try JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
                    
                    
                    for json in cityJSON {
                        
                        if let city = try City(json: json) {
                            cities.append(city)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        completion(cities)
                    }
                    
                } catch {
                    
                    print("Could Not Serialize: \(error.localizedDescription)")
                    completion([])
                }
                
            } 
            
          
            
        }
        
        
        
    }
    
    
}
