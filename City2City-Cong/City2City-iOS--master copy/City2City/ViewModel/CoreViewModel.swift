//
//  CoreViewModel.swift
//  City2City
//
//  Created by Consultants on 2/01/20.
//  Copyright © 2020 mac. All rights reserved.
//


import Foundation
import MapKit 

class CoreViewModel {
    //MARK: Properties
    var coreCities = [CoreCity]() {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.CoreNotification, object: nil)
        }
    }
    
    
    //MARK: Function
    func get() {
       coreCities = coreManager.getCoreCities()
    }
    
    
   
    
}
