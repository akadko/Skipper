//
//  Tracking.swift
//  Skipper
//
//  Created by akadko Akadko on 15.01.2022.
//

import Foundation
import CoreLocation

struct TrackingState {
  var locations: [CLLocation] = []
  var locationsCoordinates: [CLLocationCoordinate2D] {
    get {
      locations.map { $0.coordinate }
    }
  }
}
