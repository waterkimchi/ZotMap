//
//  LocationPreviewView.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/12/24.
//

import SwiftUI

struct LocationPreviewView: View {
    
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {
                Button {
                    
                } label: {
                    Text("Learn more")
                        .font(.custom("Montserrat-Bold", size: 18))
                        .frame(width: 125, height: 35)
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                    
                } label: {
                    Text("Next")
                        .font(.custom("Montserrat-Bold", size: 18))
                        .frame(width: 125, height: 35)
                }
                .buttonStyle(.bordered)
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first!)
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(6)
        .background(.accentYellow)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.custom("Montserrat-Bold", size: 20))
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
