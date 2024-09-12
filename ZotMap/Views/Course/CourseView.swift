//
//  CourseView.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/11/24.
//

import SwiftUI

struct CourseView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CourseView()
        .environmentObject(LocationViewModel())
}
