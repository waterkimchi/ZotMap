//
//  LocationMenuView.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/9/24.
//

import SwiftUI

struct SearchButtonView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        Button(action: vm.toggleLocationList) {
            Image(systemName: "magnifyingglass")
                .frame(width: Constants().menuButtonWidth, height: Constants().menuButtonHeight)
                .contentShape(RoundedRectangle(cornerRadius: 10))
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}

#Preview {
    SearchButtonView()
        .environmentObject(LocationViewModel())
}
