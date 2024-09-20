//
//  MapAnnotationView.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/19/24.
//

import SwiftUI

struct MapAnnotationView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundStyle(.accentBlue)
                .padding(6)
                .background(.accentYellow)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.accentYellow)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 10)
        }
    }
}

#Preview {
    MapAnnotationView()
}
