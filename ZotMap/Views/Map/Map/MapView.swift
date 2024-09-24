//
//  MapView.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/19/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    private let manager = CLLocationManager()
    
    var body: some View {
        
        Map(position: $vm.mapCamera) {
            UserAnnotation()
            ForEach(vm.filterCategoryBuildings()) { building in
                Annotation(coordinate: vm.buildingCoordinates(building: building)) {
                    ZStack {
                        Button {
                            vm.showNextBuilding(building: building)
                        } label: {
                            // small marker
                            ZStack {
                                Circle()
                                    .foregroundStyle(.accentYellow)
                                    .frame(width: 6, height: 6)
                                
                                // invisible circle to enhance touch response on markers
                                Circle()
                                    .opacity(0)
                                    .frame(width: 30, height: 30)
                            }
                        }
                        if vm.mapLocation == building && vm.showAnnotationSelected {
                            VStack {
                                MapAnnotationView()
                                    .onTapGesture {
                                        vm.showNextBuilding(building: building)
                                    }
                                Text(building.buildingName)
                                    .font(.custom("Montserrat-Bold", size: 17))
                                // Text color based on light/dark mode
                                    .foregroundStyle(.accentText)
                                    .frame(width: 250)
                            }
                        }
                    }
                    
                } label: {
                    if vm.mapLocation != building {
                        Text(building.buildingName)
                    }
                }
            }
        }
        .mapStyle(.standard(pointsOfInterest: .excludingAll))
        .onAppear {
            manager.requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    MapView()
        .environmentObject(LocationViewModel())
}

