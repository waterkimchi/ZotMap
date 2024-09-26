//
//  BuildingsDataService.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/13/24.
//

import Foundation

class BuildingsDataService {
    
    @Published var buildings: [Building] = []
    
    private var filename: String = "Buildings"
    
    init() {
        getBuildings()
    }
    
    func getBuildings() {
        let jsonDecoder = JSONDecoder()
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            let bldings = try jsonDecoder.decode([Building].self, from: Data(contentsOf: file))
            buildings = bldings
        } catch {
            print(error)
        }
    }
}
