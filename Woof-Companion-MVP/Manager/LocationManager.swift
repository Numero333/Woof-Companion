//
//  LocationManager.swift
//  Woof-Companion-MVP
//
//  Created by François-Xavier on 22/03/2024.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var location: CLLocationCoordinate2D?
    
    let shared = CLLocationManager()
    
    override init() {
        super.init()
        self.shared.delegate = self
        self.shared.requestWhenInUseAuthorization()
    }
    
    private func updateLocation(){
        self.shared.startUpdatingLocation()
        self.shared.stopUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            return
        case .restricted:
            return
        case .denied:
            return
        case .authorizedAlways:
            updateLocation()
        case .authorizedWhenInUse:
            updateLocation()
        @unknown default:
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else { return }
        self.location = location
    }
}
