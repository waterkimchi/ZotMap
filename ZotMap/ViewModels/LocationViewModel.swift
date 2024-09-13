//
//  LocationViewModel.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/7/24.
//

import Foundation
import MapKit
import SwiftUI
import Combine

class LocationViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Curent region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    
    // camera position of current map region
    @Published var mapCamera: MapCameraPosition = .automatic
    
    
    @Published var showLocationList: Bool = false
    
    // Coordinate system
    @Published var coordinates: [Coordinates] = []
    
    private let addresses = [
        "S Circle View Dr Irvine, CA 92617 United States"
        // Add more addresses here
    ]
    
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        if let firstLocation = locations.first {
            self.updateMapRegion(location: firstLocation)
        }
        fetchBuildingCoordinates()
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
            mapCamera = .region(mapRegion)
        }
    }
    
    public func toggleLocationList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    public func filterLocations(contains: String) -> [Location]{
        if contains.isEmpty {
            return locations
        } else {
            
            let str = contains.lowercased()
            var searchedLoc: [Location] = []
            
            for loc in locations {
                if loc.name.lowercased().contains(str) || loc.cityName.lowercased().contains(str) {
                    searchedLoc.append(loc)
                }
            }
            return searchedLoc
        }
    }
    
    public func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
    
    func fetchBuildingCoordinates() {
        let geocoder = CLGeocoder()
        var fetchedBuildings: [Coordinates] = []
        
        for address in addresses {
            geocoder.geocodeAddressString(address) { placemarks, error in
                if error != nil {
                    print(error ?? "There was an error")
                } else if let placemark = placemarks?.first {
                    let coordinate = placemark.location?.coordinate
                    if let coord = coordinate {
                        print("\nlat: \(coord.latitude), long: \(coord.longitude)")
                        fetchedBuildings.append(Coordinates(name: address, coordinate: coord))
                    }
                }
            }
        }
        self.coordinates = fetchedBuildings
    }
}
