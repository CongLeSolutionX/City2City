//
//  AlertViewController.swift
//  City2City
//
//  Created by Consultants on 2/01/20.
//  Copyright © 2020 mac. All rights reserved.
//


import UIKit

class AlertViewController: UIViewController {
    
    //MARK: IB Outlets
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    //MARK: Properties
    var viewModel: ViewModel!
    
    //MARK: VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupWeather()
    }
    

    //MARK: Functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          let touch = touches.first!
          
          if touch.view == self.view {
              dismiss(animated: true, completion: nil)
          }
          
      }
      
      func setupWeather() {
          
          guard let city = viewModel.currentCity, let weather = viewModel.currentWeather else {
              return
          }
          
          mainView.layer.cornerRadius = 25
          mainView.clipsToBounds = false
          
          cityLabel.text = "\(city.name), \(city.state)"
          weatherDescriptionLabel.text = weather.weather.first!.description
          tempLabel.text = "Temperature: \(weather.main.temperature)"
          humidityLabel.text = "Humidity: \(weather.main.humidity)"
          windSpeedLabel.text = "Wind speed: \(weather.wind.speed)"
          
      }
    //MARK: IB Action
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
  

}

//MARK: Additional functionality 
extension AlertViewController {
    
    static func weatherObject(with viewModel: ViewModel) -> AlertViewController {
        
        let storyboard = UIStoryboard(name: "Alert", bundle: Bundle.main)
        
        let alertVC = storyboard.instantiateViewController(withIdentifier: "AlertVC") as! AlertViewController
        
        alertVC.viewModel = viewModel
        
        return alertVC
        
    }
}
