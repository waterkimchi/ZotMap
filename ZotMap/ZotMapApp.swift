//
//  ZotMapApp.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/7/24.
//

import SwiftUI
import SwiftData

@main
struct ZotMapApp: App {
    
    @StateObject private var vm = LocationViewModel()
    @StateObject private var cvm = CourseViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(vm)
                .environmentObject(cvm)
        }
    }
}
