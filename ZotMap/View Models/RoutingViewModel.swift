//
//  RoutingViewModel.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/25/24.
//

import Foundation
import MapKit

class RoutingViewModel: ObservableObject {
    
    @Published var destinations: [CLLocationCoordinate2D] = []
    
    init() {
        
    }
    
    // get directions and calculate route
    public func getDirections(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D, transportType: MKDirectionsTransportType) -> MapView {
        let mapView = MKMapView()
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: from))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: to))
        request.requestsAlternateRoutes = true
        request.requestsAlternateRoutes = true
        request.transportType = transportType
        
        let directions = MKDirections(request: request)
        guard let route = response?.routes.first else { return }
        mapView.addAnnotations([p1, p2])
        mapView.addOverlay(route.polyline)
        mapView.setVisibleMapRect(
            route.polyline.boundingMapRect,
            edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
            animated: true)
        self.directions = route.steps.map { $0.instructions }.filter { !$0.isEmpty }
    }
}
