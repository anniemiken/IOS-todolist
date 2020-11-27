//
//  MapScreen.swift
//  IOS-todolist
//
//  Created by Bahja Faqid on 2020-11-27.
//

import UIKit
import MapKit
import CoreLocation

class MapScreen: UIViewController{
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        
    }
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
    }
    
    func centerViewOnUserLocation(){
        if let loc = locationManager.location?.coordinate{
            let reg = MKCoordinateRegion.init(center: loc, latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(reg, animated: true)
        }
    }
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocAuth()
        }else{
            //
        }
    }
    
    func checkLocAuth(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
    }
}


extension MapScreen: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{return}
        locationManager.stopUpdatingLocation()
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let reg = MKCoordinateRegion.init(center: center, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView.setRegion(reg, animated: true)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocAuth()
    }
}
