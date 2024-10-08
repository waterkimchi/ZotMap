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
            Section {
                Button("Show All") {
                    vm.showAllLocations()
                }
                Button("Remove Filter") {
                    vm.filteredCategories.removeAll()
                }
            }
            Section {
                ForEach(vm.buildingCategories(), id: \.self) { category in
                    Button {
                        vm.toggleCategoryFilter(category: category)
                    } label: {
                        if vm.filteredCategories.contains(category) {
                            Label(category, systemImage: "checkmark")
                        } else {
                            Text(category)
                        }
                    }
                    .menuActionDismissBehavior(.disabled)
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
