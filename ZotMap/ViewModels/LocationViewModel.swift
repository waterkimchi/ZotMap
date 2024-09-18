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
    
    let defaultMapSpan = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    
    // Current location on map
    @Published var mapLocation: Building {
        didSet {
            updateMapRegion(location: mapLocation, mapSpan: defaultMapSpan)
        }
    }
    // Curent region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let startSpan = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    // camera position of current map region
    @Published var mapCamera: MapCameraPosition = .automatic
    
    
    // Locations
    @Published var showLocationList: Bool = false
    
    // Buildings
    @Published var buildings: [Building] = []
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        // locations init
        self.mapLocation = Building(buildingName: "University of California, Irvine", buildingCategory: "School", latitude: 33.6424, longitude: -117.8417)
        if let firstLocation = buildings.first {
            self.updateMapRegion(location: firstLocation, mapSpan: startSpan)
        }
        
        // buildings init
        BuildingsDataService().$buildings
            .sink { [weak self] (returnCourses) in
                self?.buildings = returnCourses
            }
            .store(in: &cancellables)
    }
    
    private func buildingCoordinates(building: Building) -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: building.latitude, longitude: building.longitude)
    }
    
    // updates the viewing region span
    private func updateMapRegion(location: Building, mapSpan: MKCoordinateSpan) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: buildingCoordinates(building: location),
                span: mapSpan)
            mapCamera = .region(mapRegion)
        }
    }
    
    public func toggleLocationList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    
    public func filterBuildings(contains: String) -> [Building] {
        if contains.isEmpty {
            return buildings
        } else {
            let str = contains.lowercased()
            var searchedBuild: [Building] = []
            
            for bld in buildings {
                if bld.buildingName.lowercased().contains(str) || bld.buildingCategory.lowercased().contains(str) {
                    searchedBuild.append(bld)
                }
            }
            return searchedBuild
        }
    }
    
    public func showNextBuilding(building: Building) {
        withAnimation(.easeInOut) {
            mapLocation = building
            showLocationList = false
        }
    }
    
    public func buildingCategories() -> [String] {
        var buildingCategories: [String] = []
        for building in buildings {
            if !buildingCategories.contains(building.buildingCategory) {
                buildingCategories.append(building.buildingCategory)
            }
        }
        return buildingCategories
    }
}
