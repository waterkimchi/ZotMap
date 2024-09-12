//
//  GrayBackgroundView.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/9/24.
//

import SwiftUI

struct GrayBackgroundView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
       
    }
}

#Preview {
    GrayBackgroundView()
        .environmentObject(LocationViewModel())
}
