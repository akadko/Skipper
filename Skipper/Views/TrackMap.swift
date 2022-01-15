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
  @State private var userTrackingMode: MapUserTrackingMode = .follow
  @State private var region = MKCoordinateRegion(
          center: CLLocationCoordinate2D(
              latitude: 59.9311,
              longitude: 30.3609
          ),
          span: MKCoordinateSpan(
            latitudeDelta: 0.05,
            longitudeDelta: 0.05
          )
      )
  
  var body: some View {
    Map(
      coordinateRegion: $region,
      interactionModes: MapInteractionModes.all,
      showsUserLocation: true,
      userTrackingMode: $userTrackingMode
    )
  }
}
