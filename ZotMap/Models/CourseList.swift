//
//  CourseList.swift
//  ZotMap
//
//  Created by Hyunsu Lim on 9/11/24.
//

import Foundation


// api link: https://api.peterportal.org/rest/v0/courses/all
// REST API call for json

struct CourseList: Identifiable, Codable {
    let id, department, number, school: String
    let title, courseLevel: String
    let departmentAlias: [String?]
    let units: [Double?]
    let description, departmentName: String?
    let professorHistory: [String?]
    let prerequisiteTree: String?
    let prerequisiteList: [String?]
    let prerequisiteText: String?
    let prerequisiteFor: [String?]
    let repeatability, gradingOption, concurrent, sameAs: String?
    let restriction, overlap, corequisite: String?
    let geList: [String?]
    let geText: String?
    let terms: [String?]
    
    enum CodingKeys: String, CodingKey {
        case id, department, number, school, title
        case courseLevel = "course_level"
        case departmentAlias = "department_alias"
        case units, description
        case departmentName = "department_name"
        case professorHistory = "professor_history"
        case prerequisiteTree = "prerequisite_tree"
        case prerequisiteList = "prerequisite_list"
        case prerequisiteText = "prerequisite_text"
        case prerequisiteFor = "prerequisite_for"
        case repeatability
        case gradingOption = "grading_option"
        case concurrent
        case sameAs = "same_as"
        case restriction, overlap, corequisite
        case geList = "ge_list"
        case geText = "ge_text"
        case terms
    }
}
