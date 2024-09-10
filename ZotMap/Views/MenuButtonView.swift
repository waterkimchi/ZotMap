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
            ForEach(vm.locations) { location in
                Button {
                    
                }label: {
                    HStack{
                        VStack(alignment: .leading) {
                            Text(location.name)
                        }
                        if let imageName = location.imageNames.first {
                            Image(imageName)
                        }
                    }
                }
            }
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

#Preview {
    MenuButtonView()
        .environmentObject(LocationViewModel())
}
