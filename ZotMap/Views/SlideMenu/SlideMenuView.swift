//
//  SlideMenuView.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/9/24.
//

import SwiftUI

struct SlideMenuView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    vm.toggleLocationList()
                }
                .zIndex(1)
            
            HStack {
                VStack(alignment: .leading, spacing: 32) {
                    Text("Side Bar")
                        .foregroundStyle(.white)
                    Spacer()
                }
                .padding()
                .frame(width: 270, alignment: .leading)
                .background(.accentBlue)
                
                Spacer()
            }
            .zIndex(2)
        }
        .transition(.move(edge: .leading))
    }
}

#Preview {
    SlideMenuView()
        .environmentObject(LocationViewModel())
}
