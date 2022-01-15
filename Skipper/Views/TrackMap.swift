//
//  TrackMap.swift
//  Skipper
//
//  Created by akadko Akadko on 15.01.2022.
//

import Foundation
import SwiftUI
import MapKit

struct TrackMap: View {
  
  @EnvironmentObject var appState: AppState
  @Environment(\.trackingViewModel) var tracking: TrackingViewModel
  
  @State private var region = MKCoordinateRegion(
          center: CLLocationCoordinate2D(
              latitude: 59.9311,
              longitude: 30.3609
          ),
          span: MKCoordinateSpan(
            latitudeDelta: 0.01,
            longitudeDelta: 0.01
          )
      )
  
  var body: some View {
    MapView(
      region: $region,
      lineCoordinates: appState.tracking.locationsCoordinates
    ).onAppear {
      tracking.start()
    }.onReceive(self.appState.$tracking) { trackingState in
      if let location = trackingState.locations.last {
        self.region.center = location.coordinate
      }
    }
  }
}
