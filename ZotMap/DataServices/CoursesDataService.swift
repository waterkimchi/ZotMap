//
//  CoursesDataService.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/11/24.
//

import Foundation
import Combine

class CoursesDataService {
    
    @Published var allCourses: [CourseList] = []
    
    var courseSubscription: AnyCancellable?
    
    init() {
        getCourses()
    }
    
    private func getCourses() {
        
        guard let url = URL(string: "https://api.peterportal.org/rest/v0/courses/all") else {
            return
        }
        
        courseSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CourseList].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] (returnedCourses) in
                self?.allCourses = returnedCourses
                self?.courseSubscription?.cancel()
            }
    }
}
