//
//  LocationView.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/7/24.
//

import SwiftUI
import MapKit

struct LocationView: View {
   
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        ZStack {
            Map()
        }
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}
