//
//  LocationPreviewView.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/12/24.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    let building: Building
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                titleSection
            }
            VStack {
                detailsButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .background(Color.accentColor)
        )
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    LocationPreviewView(building: Building(buildingName: "UCI Campus", buildingCategory: "Campus", latitude: 37.2334, longitude: -170.23))
}

extension LocationPreviewView {
    
    private var titleSection: some View {
        Button {
            vm.showNextBuilding(building: building)
        } label: {
            VStack(alignment: .leading, spacing: 5) {
                Text(building.buildingName)
                    .font(.custom("Montserrat-Bold", size: 20))
                
                Text(building.buildingCategory)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.white)
        }
    }
    
    private var detailsButton: some View {
        Button {
            
        } label: {
            Text("Details")
                .font(.custom("Montserrat-Bold", size: 18))
                .frame(width: 100, height: 35)
        }
        .background(.accentYellow)
        .foregroundStyle(.accentBlue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .buttonStyle(.bordered)
    }
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.custom("Montserrat-Bold", size: 18))
                .frame(width: 100, height: 35)
        }
        .background(.accentYellow)
        .foregroundStyle(.accentBlue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .buttonStyle(.bordered)
    }
}
