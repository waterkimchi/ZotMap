//
//  Coordinates.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/12/24.
//

import Foundation
import SwiftUI
import MapKit

struct Coordinates: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
