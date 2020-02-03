//
//  String+Extension.swift
//  City2City
//
//  Created by Consultants on 2/01/20.
//  Copyright © 2020 mac. All rights reserved.
//


import Foundation


extension String {
    
    
    func withCommas() -> String? {
        
        guard let number = Int(self) else {
            return nil
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal  //add commas to numbers
        
        
        return numberFormatter.string(from: NSNumber(value: number))!
    }
    
    // adding comma for the population values
    var addCommas: String? {
        
        guard let number = Int(self) else {
            return nil
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: number))!
    }
    
    
    
}
