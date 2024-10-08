//
//  MinimizedAnnotationView.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/26/24.
//

import SwiftUI

struct MinimizedAnnotationView: View {
    var body: some View {
        // small marker
        ZStack {
            ZStack {
                Circle()
                    .foregroundStyle(.accentYellow)
                    .frame(width: 6, height: 6)
                Circle()
                    .foregroundStyle(.accentBlue)
                    .frame(width: 4, height: 4)
            }
            
            
            // invisible circle to enhance touch response on markers
            Circle()
                .opacity(0)
                .frame(width: 30, height: 30)
        }
    }
}

#Preview {
    MinimizedAnnotationView()
}
