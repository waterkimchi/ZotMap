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
    
    @State private var mapStyleSelect: MapStyle = .standard(elevation: .realistic)
    
    let manager = CLLocationManager()
    
    var body: some View {
        ZStack {
            Map(position: $vm.mapCamera) {
                UserAnnotation()
                ForEach(vm.buildings) { building in
                    Annotation(building.buildingName, coordinate: vm.buildingCoordinates(building: building)) {
                        ZStack {
                            Circle()
                                .foregroundColor(.blue)
                                .frame(width: 6, height: 6)
                        }
                    }
                        
                }
            }
            .mapStyle(mapStyleSelect)
            .onAppear {
                manager.requestWhenInUseAuthorization()
            }
            .zIndex(1)
            VStack(spacing: 0) {
                if !vm.showLocationList {
                    header
                        .padding()
                    Spacer()
                }
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
        HStack {
            SearchButtonView()
            Spacer()
            MenuButtonView()
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

