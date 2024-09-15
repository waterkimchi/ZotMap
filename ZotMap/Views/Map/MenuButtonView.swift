//
//  MenuView.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/8/24.
//

import SwiftUI

struct MenuButtonView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        Menu {
            ForEach(vm.buildingCategories(), id: \.self) { categories in
                Button {
                    
                } label: {
                    Text(categories)
                }
            }
            
        } label: {
            Image(systemName: "slider.horizontal.3")
                .frame(height: Constants().menuButtonHeight)
                .frame(maxWidth: Constants().menuButtonWidth)
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}

#Preview {
    MenuButtonView()
        .environmentObject(LocationViewModel())
}
