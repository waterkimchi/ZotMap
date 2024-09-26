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
    
    let defaultMapSpan = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
    
    
    // Map Camera variables
    // Current location on map
    // Called once loaded: focuses on the UCI campus
    private var defaultLocation: Building = Building(buildingName: "University of California, Irvine", buildingCategory: "School", latitude: 33.6424, longitude: -117.8417)
    // Curent region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let startSpan = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    // camera position of current map region
    @Published var mapCamera: MapCameraPosition = .automatic
    
    // Current location for mapping
    @Published var mapLocation: Building {
        didSet { updateMapRegion(location: mapLocation, mapSpan: defaultMapSpan) }
    }
    
    // Buildings
    @Published var buildings: [Building] = [] // carries all the building data processed from raw JSON
    @Published var colors: [Color] = []
    @Published var filteredCategories: [String] = [] // filter for filter menu, default: all selected
    private var cancellables = Set<AnyCancellable>()
    
    // Booleans
    @Published var showLocationList: Bool = false
    @Published var showAnnotationSelected: Bool = false
    
    // Called once app is first loaded
    init() {
        // route default location to the current location
        self.mapLocation = defaultLocation
        // if location is loaded, update map region to first location
        if let firstLocation = buildings.first {
            self.updateMapRegion(location: firstLocation, mapSpan: startSpan)
        }
        
        // buildings init
        // syncs the data from the json raw file
        BuildingsDataService().$buildings
            .sink { [weak self] (returnCourses) in
                self?.buildings = returnCourses
            }
            .store(in: &cancellables)
        
        // initialize filter for buildings
        showAllLocations()
    }
    
    // convert building coordinates into CLLocationCoordinate2D
    public func buildingCoordinates(building: Building) -> CLLocationCoordinate2D {
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

    
    // add categories to the filteredCategories array
    public func filterBuildings(contains: String, showWhenEmpty: Bool) -> [Building] {
        if contains.isEmpty && showWhenEmpty {
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
    
    
    // filter category based on published variable
    public func filterCategoryBuildings() -> [Building] {
        var resBuilding: [Building] = []
        if !filteredCategories.isEmpty {
            for building in buildings {
                for filter in filteredCategories {
                    if building.buildingCategory.contains(filter) {
                        resBuilding.append(building)
                    }
                }
            }
        } else {
            return resBuilding
        }
        return resBuilding
    }
    
    // show all locations by adding all categories in the filtedCategories array
    public func showAllLocations() {
        for category in buildingCategories() {
            filteredCategories.append(category)
        }
    }
    
    
    public func toggleCategoryFilter(category: String) {
        for filter in filteredCategories {
            if(filter == category) {
                filteredCategories.remove(at: filteredCategories.firstIndex(of: filter)!)
                return
            }
        }
        filteredCategories.append(category)
    }
    
    // move camera map lcoation to parameter building
    public func showNextBuilding(building: Building) {
        withAnimation(.easeInOut) {
            showAnnotationSelected = true
            mapLocation = building
            showLocationList = false
        }
    }
    
    // return all building categories in an array
    public func buildingCategories() -> [String] {
        //include all buildings that is not repetitive in category
        var buildingCategories: [String] = []
        for building in buildings {
            // split elements with " + "
            let categories = building.buildingCategory.split(separator: "+").map { $0.trimmingCharacters(in: .whitespaces) }
            for cat in categories {
                if !buildingCategories.contains(cat) {
                    buildingCategories.append(cat)
                }
            }
        }
        buildingCategories.sort(by: < )
        return buildingCategories
    }
}
