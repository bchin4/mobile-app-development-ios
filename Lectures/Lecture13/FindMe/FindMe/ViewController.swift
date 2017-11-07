//
//  ViewController.swift
//  FindMe
//
//  Created by Robert Stjacques Jr on 10/26/17.
//  Copyright © 2017 Mobile Application Development. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    // label for latitude
    @IBOutlet var latitudeLabel: UILabel!
    // label for longitude
    @IBOutlet var longitudeLabel: UILabel!
    // the locaion manager
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = 10
        
        latitudeLabel.text = "Not Available"
        longitudeLabel.text = "Not Available"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startLocationServices(_ sender: Any) {
        // action to start getting location information
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.denied {
            showAlert(title: "Location Services",
                      message: "This app needs location services to run, but was denied.")
        }
        else if status == CLAuthorizationStatus.restricted {
            showAlert(title: "Locatin Services Needed",
                      message: "This app is blocked from accessing location services by parental controls.")
        }
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func stopLocationServices(_ sender: Any) {
        // action to stop getting location information
        locationManager.stopUpdatingLocation()
        longitudeLabel.text = "Not Available"
        latitudeLabel.text = "Not Available"
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location: " + error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Received a location update!")
        for location in locations {
            let coordinate = location.coordinate
            longitudeLabel.text = coordinate.longitude.description
            latitudeLabel.text = coordinate.latitude.description
        }
    }
    
    func takesAClosure( closure: (String, Int) -> Bool) {
        var foo = {(string: String) -> Void in
            print(string)
        }
        
        foo("Hello!")
        
        foo = {(_ : String) -> Void in
            print("Hi!")
        }
        
        foo("Doesn't matter")
    }
    
    
    func showAlert(title: String, message: String) {
        let openSettings = {(action: UIAlertAction) -> Void in
            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!)
        }
        
        let ac = UIAlertController(title: title,
                                   message: message,
                                   preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .cancel, handler: nil)
        ac.addAction(okAction)
        
        let settingsAction = UIAlertAction(title: "Settings",
                                           style: .default,
                                           handler: openSettings)
        ac.addAction(settingsAction)
        
        present(ac, animated: true, completion: nil)
    }
}

