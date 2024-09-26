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
    
    func setLocation(location: CLLocationCoordinate2D) {
        
    }
}
