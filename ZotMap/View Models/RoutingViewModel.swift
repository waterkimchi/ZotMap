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
    public func getDirections(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D, transportType: MKDirectionsTransportType) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: from))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: to))
        request.requestsAlternateRoutes = true
        request.requestsAlternateRoutes = true
        request.transportType = transportType
        
        let directions = MKDirections(request: request)
        
//        directions.calculate { [unowned self] response, error in
//            guard let unwrappedResponse = response else { return }
//            
//            for route in unwrappedResponse.routes {
//                self.mapView.addOverlay(route.polyline)
//                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
//           }
//        }
    }
    
}
