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
    
    @State private var mapStyleSelect: MapStyle = .standard
    
    var body: some View {
        ZStack {
            Map(position: $vm.mapCamera)
                .mapStyle(mapStyleSelect)
                .ignoresSafeArea()
                .zIndex(1)
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
            }
            .zIndex(2)
            if vm.showLocationList {
               dimSquare
                    .zIndex(3)
            }
            if vm.showLocationList {
                SlideMenuView()
                    .zIndex(4)
            }
        }
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}

extension LocationView {
    private var header: some View {
        ZStack {
            HStack {
                Spacer()
                MenuButtonView()
            }
            HStack {
                SearchButtonView()
                Spacer()
            }
        }
    }
    
    private var dimSquare: some View {
        Rectangle()
            .foregroundStyle(.black)
            .opacity(0.3)
            .ignoresSafeArea()
            .onTapGesture {
                vm.toggleLocationList()
            }
    }
}
