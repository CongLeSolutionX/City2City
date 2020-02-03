//
//  ViewModel.swift
//  City2City
//
//  Created by Consultants on 2/01/20.
//  Copyright © 2020 mac. All rights reserved.
//


import Foundation

protocol ViewModelDelegate: class {
    func updateView()
}

class ViewModel {
    //MARK: Properties
    weak var delegate: ViewModelDelegate?
    
    private(set) var cities = [City]() {
        didSet {
            orderedCities = order(with: cities)
        }
    }
    
    private(set) var orderedCities = [String: [City]]() {
        didSet {
            delegate?.updateView()
        }
    }
    
    var filteredCities = [City]()
    
    var currentCity: City!
    var currentWeather: Weather!
    
    //MARK: Functions
    
    func get() {
        
        cityManager.getCities { [unowned self] cities in
            
            self.cities = cities
            print("City Count: \(self.cities.count)")
        }
    }
     
    private func order(with cities: [City]) -> [ String : [City] ] {
        
        //create an empty dictionary
        var orderedCities = Dictionary(grouping: cities, by: {$0.name.prefix(1).uppercased()})
        
        //order cities alphabetically
        for (key, value) in orderedCities {
            
            orderedCities[key] = value.sorted(by: {$0.name < $1.name})
            
        }
        
        return orderedCities
    }
    
    
} 
