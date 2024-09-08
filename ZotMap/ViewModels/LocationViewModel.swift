//
//  LocationViewModel.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/7/24.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    // Current lcoation on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    
    @Published var mapCamera: MapCameraPosition = .automatic
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        if let firstLocation = locations.first {
            self.updateMapRegion(location: firstLocation)
        }
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
            mapCamera = .region(mapRegion)
        }
    }
}
