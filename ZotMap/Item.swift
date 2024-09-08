//
//  Item.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/7/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
