//
//  TrackMap.swift
//  Skipper
//
//  Created by akadko Akadko on 15.01.2022.
//

import Foundation
import SwiftUI
import MapKit

let StPetersburgCoordinates = CLLocationCoordinate2D(
  latitude: 59.9311,
  longitude: 30.3609
)

struct TrackMap: View {
  
  @EnvironmentObject var appState: AppState
  @Environment(\.trackingViewModel) var tracking: TrackingViewModel
  
  @State private var region = MKCoordinateRegion(
      center: StPetersburgCoordinates,
      span: MKCoordinateSpan(
        latitudeDelta: 0.01,
        longitudeDelta: 0.01
      )
    )
  
  var body: some View {
    MapView(
      region: $region,
      lineCoordinates: appState.tracking.locations
    ).onAppear {
      tracking.start()
    }
  }
}
