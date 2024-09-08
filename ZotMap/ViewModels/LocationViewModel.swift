//
//  LocationViewModel.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/7/24.
//

import Foundation

class LocationViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
