//
//  CourseView.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/11/24.
//

import SwiftUI

struct CourseView: View {
    
    @EnvironmentObject private var vm: CourseViewModel
    
    @State private var searchText: String = ""
    @State private var searchIsActive: Bool = false
    
    var body: some View {
        VStack {
            searchBar
            List {
                ForEach(vm.filterCourses(contains: searchText)) { courses in
                    HStack {
                        Text(courses.id)
                            .font(.custom("Montserrat-Bold", size: 12))
                        Text(courses.title)
                    }
                }
            }
        }
    }
}

#Preview {
    CourseView()
        .environmentObject(CourseViewModel())
}

extension CourseView {
    
    private var searchBar: some View {
        ZStack {
            HStack {
                Spacer(minLength: 15)
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 35)
                    .opacity(0.15)
                Spacer(minLength: 15)
            }
            HStack {
                Spacer(minLength: 25)
                TextField("", text: $searchText, prompt: Text("search").foregroundStyle(.gray))
                    .autocorrectionDisabled()
                    .textFieldStyle(.plain)
                    .searchable(text: $searchText, isPresented: $searchIsActive)
                Spacer(minLength: 25)
            }
        }
    }
}
