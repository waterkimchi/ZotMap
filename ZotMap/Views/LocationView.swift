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
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
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
            Spacer()
            Menu {
                Button {
                } label: {
                    Label("New Album", systemImage: "rectangle.stack.badge.plus")
                }
                Button {
                } label: {
                    Label("New Folder", systemImage: "folder.badge.plus")
                }
                Button {
                } label: {
                    Label("New Shared Album", systemImage: "rectangle.stack.badge.person.crop")
                }
            } label: {
                Image(systemName: "line.3.horizontal")
                    .frame(height: 50)
                    .frame(maxWidth: 50)
            }
            .background(.thickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
        }
    }
}
