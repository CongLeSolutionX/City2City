//
//  RecentsViewController.swift
//  City2City
//
//  Created by Consultants on 2/01/20.
//  Copyright © 2020 mac. All rights reserved.
//


import UIKit
import MapKit

class MostRecentViewController: UIViewController {
    //MARK: IB Outlets
    @IBOutlet weak var recentsTableView: UITableView!
    
    @IBOutlet weak var mapView: MKMapView?
    //MARK: Properties
    var coreViewModel = CoreViewModel()
   
    
    //MARK: VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRecents()
        createObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        coreViewModel.get()
    }
    
    
    
    //MARK: Functions
    // Notification Observer
    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateView), name: Notification.Name.CoreNotification, object: nil)
    }
    
    @objc func updateView() {
        recentsTableView.reloadData()
    }
 
    func setupRecents() {
        recentsTableView.register(UINib(nibName: CityTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: CityTableCell.identifier)
        recentsTableView.tableFooterView = UIView(frame: .zero)
        title = "Recent Cities"
    }
    
 
    

}

//MARK: Additional functionality 
extension MostRecentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreViewModel.coreCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableCell.identifier, for: indexPath) as! CityTableCell
        
        let coreCity = coreViewModel.coreCities[indexPath.row]
        let city = City(with: coreCity)
        
        cell.reformat(with: city)
        
        return cell
    }
}

extension MostRecentViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //TODO: SHOW THE MAP OF RECENT CITY 
       
        let selectedRecentCity = coreViewModel.coreCities[indexPath.row]
       
        print("\(selectedRecentCity.latitude)")
        print("\(selectedRecentCity.longitude)")
        
        let coordinates = CLLocationCoordinate2D(latitude: selectedRecentCity.latitude, longitude: selectedRecentCity.longitude)
 
 
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            
            let city = coreViewModel.coreCities[indexPath.row]
            coreManager.delete(with: city)
            coreViewModel.coreCities.remove(at: indexPath.row)
        
        default:
            break
        }
    }
    
}
