//
//  CityTableCell.swift
//  City2City
//
//  Created by Consultants on 2/01/20.
//  Copyright © 2020 mac. All rights reserved.
//


import UIKit

class CityTableCell: UITableViewCell {
    //MARK: IB Outlet
    @IBOutlet weak var cityMainLabel: UILabel!
    @IBOutlet weak var citySubLabel: UILabel!
    
    //MARK: Properties
    static let identifier = "CityTableCell"
    
    //MARK: Functions
    func reformat(with city: City) {
        
        cityMainLabel.text = "\(city.name), \(city.state)"
        
        let population = city.population.addCommas ?? "0" // coleasing with default value of 0
        
        citySubLabel.text = "Population: \(population)"
        
    }
    
    
    
    
}



