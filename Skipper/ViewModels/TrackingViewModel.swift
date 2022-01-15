//
//  TrackingViewModel.swift
//  Skipper
//
//  Created by akadko Akadko on 15.01.2022.
//

import Foundation
import CoreLocation

let significantDistance = 5.0 // meters

class TrackingViewModel: NSObject, CLLocationManagerDelegate {
  let locationManager = CLLocationManager()
  
  let appState: AppState
  
  init(_ appState: AppState) {
    self.appState = appState
  }
  
  func start() {
    if locationManager.delegate == nil {
      locationManager.delegate = self
    }
    switch (locationManager.authorizationStatus) {
    case .authorizedAlways, .authorizedWhenInUse:
      locationManager.startUpdatingLocation()
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    case .restricted, .denied:
      // show error
      break
    @unknown default:
      locationManager.requestWhenInUseAuthorization()
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    for location in locations {
      if isDistanceSignificant(newLocation: location) {
        self.appState.tracking.locations.append(location)
      }
    }
  }
  
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    locationManager.startUpdatingLocation()
  }
  
  func isDistanceSignificant(newLocation: CLLocation) -> Bool {
    if let lastLocation = self.appState.tracking.locations.last {
      let distance = newLocation.distance(from: lastLocation)
      return distance > significantDistance
    }
    return true
  }
}
