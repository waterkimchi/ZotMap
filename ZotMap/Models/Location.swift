//
//  Location.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/7/24.
//

import Foundation
import MapKit

// Used with MapKit
// Data Struct File: all data for each location
// each Location needs name, cityName, coordinates, description, image, link
struct Location: Identifiable{
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        // name = "Colosseum", cityName = "Rome"
        // id = "ColosseumRome"
        name + cityName
    }
}

