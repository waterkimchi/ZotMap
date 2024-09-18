//
//  Buildings.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/13/24.
//

import Foundation

struct Building: Identifiable, Codable, Equatable {
    let buildingName: String
    let buildingCategory: String
    let latitude: Double
    let longitude: Double
    
    var id: String {
        buildingName + buildingCategory
    }
}
