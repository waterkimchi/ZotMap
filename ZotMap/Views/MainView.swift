//
//  MainView.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/11/24.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        TabView {
            LocationView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
           CourseView()
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("Courses")
                }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(LocationViewModel())
}
