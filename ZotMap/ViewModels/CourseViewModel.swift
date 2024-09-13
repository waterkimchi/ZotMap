//
//  CourseViewModel.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/12/24.
//

import Foundation
import Combine

class CourseViewModel: ObservableObject {
    // Course list
    @Published var allCourses: [CourseList] = []
    
    private let dataService = CoursesDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        dataService.$allCourses
            .sink { [weak self] (returnCourses) in
                self?.allCourses = returnCourses
            }
            .store(in: &cancellables)
    }
    
    public func filterCoursesId(contains: String) -> [CourseList] {
        let str = contains.lowercased()
        var searchedCrs: [CourseList] = []
        
        for crs in allCourses {
            if crs.id.lowercased().contains(str) {
                searchedCrs.append(crs)
            }
        }
        return searchedCrs
    }
    
    func filterCoursesDepartment(contains: String) -> [CourseList] {
        let str = contains.lowercased()
        var searchedCrs: [CourseList] = []
        
        for crs in allCourses {
            if crs.department.lowercased().contains(str) {
                searchedCrs.append(crs)
            }
        }
        return searchedCrs
    }
    
    public func categorizeCourses() -> [String] {
        
        var categories: [String] = []
        
        for crs in allCourses {
            if !(categories.contains(crs.department)) {
                categories.append(crs.department)
            }
        }
        
        return categories
    }
    
}
