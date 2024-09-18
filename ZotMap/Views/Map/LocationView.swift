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
    
    let manager = CLLocationManager()
    
    var body: some View {
        ZStack {
            map
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
                    .zIndex(4)
                SlideMenuView()
                    .zIndex(5)
            } else {
                previewCard
                    .zIndex(3)
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
    
    private var map: some View {
        Map(position: $vm.mapCamera) {
            UserAnnotation()
            ForEach(vm.filterCategoryBuildings()) { building in
                Annotation(building.buildingName, coordinate: vm.buildingCoordinates(building: building)) {
                    ZStack {
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: 6, height: 6)
                    }
                }
            }
        }
        .mapStyle(.standard(pointsOfInterest: .excludingAll))
        .onAppear {
            manager.requestWhenInUseAuthorization()
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
    
    private var previewCard: some View {
        VStack(spacing: 0) {
            Spacer()
            ZStack {
                ForEach(vm.buildings) { building in
                    if vm.mapLocation == building {
                        LocationPreviewView(building: building)
                            .shadow(color: Color.black.opacity(0.3), radius: 20)
                            .padding()
                            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                    }
                }
            }
        }
    }
}

