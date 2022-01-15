//
//  MapView.swift
//  Skipper
//
//  Created by akadko Akadko on 15.01.2022.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

  @Binding var region: MKCoordinateRegion
  let lineCoordinates: [CLLocationCoordinate2D]
  
  let showsUserLocation = true
  let strokeColor = Color.primary
  let lineWidth = 4.0
  
  func makeUIView(context: Context) -> MKMapView {
    let mapView = MKMapView()
    mapView.delegate = context.coordinator
    mapView.region = region
    mapView.showsUserLocation = showsUserLocation
    mapView.userTrackingMode = .followWithHeading
    drawPolyline(mapView)
    return mapView
  }

  func updateUIView(_ mapView: MKMapView, context: Context) {
    mapView.setRegion(region, animated: true)
    drawPolyline(mapView)
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self, strokeColor: strokeColor, lineWidth: lineWidth, region: $region)
  }
  
  private func drawPolyline(_ mapView: MKMapView) {
    let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
    mapView.addOverlay(polyline)
  }
}

class Coordinator: NSObject, MKMapViewDelegate {
  var parent: MapView
  let strokeColor: Color
  let lineWidth: Double
  var region: Binding<MKCoordinateRegion>

  init(_ parent: MapView, strokeColor: Color, lineWidth: Double, region: Binding<MKCoordinateRegion>) {
    self.parent = parent
    self.strokeColor = strokeColor
    self.lineWidth = lineWidth
    self.region = region
  }
  
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    if let routePolyline = overlay as? MKPolyline {
      let renderer = MKPolylineRenderer(polyline: routePolyline)
      renderer.strokeColor = UIColor(self.strokeColor)
      renderer.lineWidth = CGFloat(self.lineWidth)
      return renderer
    }
    return MKOverlayRenderer()
  }
  
  func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
    region.wrappedValue.center = mapView.region.center
    region.wrappedValue.span = mapView.region.span
  }
}
