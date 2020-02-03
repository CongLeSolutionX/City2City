//
//  MapViewController.swift
//  City2City
//
//  Created by Consultants on 2/01/20.
//  Copyright © 2020 mac. All rights reserved.
//


import UIKit
import MapKit

class MapViewController: UIViewController {
    // MARK: IB Outlet
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: Properties
    var viewModel: ViewModel!
    
    //MARK: VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMap()
        getWeather()
        createBarButtonItems()
    }
    
    //MARK: Functions
    
    func getWeather() {
        
       weatherService.getWeather(from: viewModel.currentCity) { [unowned self] (weather, err) in
            
            if let error = err {
                
                self.showAlert(
                    title: "Could Not Access Weather: \(self.viewModel.currentCity.name), \(self.viewModel.currentCity.state)",
                    message: error.localizedDescription)
            }
        
            
            if let weather = weather {
                self.viewModel.currentWeather = weather
                print("\(self.viewModel.currentCity.name), \(self.viewModel.currentCity.state), Weather: \(weather.weather.first!.description)")
                
            }
        }
    }
    
    private func setupMap() {
        
        let coordinates = viewModel.currentCity.coordinates
        
        let region = MKCoordinateRegion(center: coordinates, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        let location = MKPointAnnotation()
        location.coordinate = coordinates
        location.title = "\(viewModel.currentCity.name)"
        location.subtitle = "\(viewModel.currentCity.state)"
        
        mapView.addAnnotation(location)
        mapView.setRegion(region, animated: true)
        
      
    }
    
      
    @objc func getWeatherObject() {
        let alert = AlertViewController.weatherObject(with: viewModel)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func createBarButtonItems() {
        
        let currentWeatherButton = UIBarButtonItem(title: "Current weather", style: .done, target: self, action: #selector(getWeatherObject))
        navigationItem.rightBarButtonItem = currentWeatherButton

       
        
    }

}


