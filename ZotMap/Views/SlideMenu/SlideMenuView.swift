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
            HStack {
                VStack(alignment: .leading, spacing: 32) {
                    header
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

extension SlideMenuView {
    private var header: some View {
        ZStack {
            Rectangle()
                .frame(width: 190, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .opacity(0.5)
                .padding()
            HStack {
                Image("Logo2")
                    .resizable()
                    .imageScale(.large)
                    .frame(width: 48, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.vertical)
                Image("TextLogo")
                    .resizable()
                    .imageScale(.large)
                    .frame(width: 120, height: 130)
            }
        }
    }
}
