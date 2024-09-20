//
//  SlideMenuView.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/9/24.
//

import SwiftUI
import MapKit

struct SlideMenuView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    @State private var searchText: String = ""
    @State private var showCancelButton: Bool = false
    @State private var searchIsActive: Bool = false
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    header
                    searchBar
                    if !searchIsActive {
                        locationList
                    }
                    Spacer()
                }
                .padding()
                .frame(width: Constants().slideMenuWidth, alignment: .leading)
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
                .frame(width: Constants().slideHeaderSquareWidth, height: Constants().slideHeaderSquareHeight)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .foregroundStyle(Color.black)
                .opacity(0.4)
                .shadow(radius: 10)
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
                    .scaledToFill()
                    .frame(width: 120, height: 80)
            }
        }
    }
    
    private var locationList: some View {
        List {
            ForEach(vm.filterBuildings(contains: searchText)) { building in
                Button {
                    vm.showNextBuilding(building: building)
                } label: {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(building.buildingName)
                                .font(.custom("Montserrat-SemiBold", size: 20))
                                .foregroundStyle(.accentYellow)
                            Text(building.buildingCategory)
                                .font(.custom("Montserrat-Regular", size: 16))
                                .foregroundStyle(.white)
                        }
                    }
                }
                .listRowBackground(Color.accentBlue)
            }
        }
        .listStyle(.plain)
    }
    
    private var searchBar: some View {
        ZStack {
            HStack {
                Spacer(minLength: 13)
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 35)
                    .foregroundStyle(.black)
                    .opacity(0.15)
                Spacer(minLength: 15)
            }
            
            HStack {
                Spacer(minLength: 25)
                TextField("", text: $searchText, prompt: Text("search").foregroundStyle(.gray))
                    .foregroundStyle(.white)
                    .autocorrectionDisabled()
                    .textFieldStyle(.plain)
                    .searchable(text: $searchText, isPresented: $searchIsActive)
                    .onSubmit {
                        
                    }
                
                
                Spacer(minLength: 25)
            }
        }
        
    }
}
