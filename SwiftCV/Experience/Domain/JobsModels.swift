//
//  JobsModels.swift
//  SwiftCV
//
//  Created by José María Jiménez on 20/10/24.
//

struct JobModel: Decodable {
    let company: String
    let date: String
    let description: String
    let projects: [ProjectModel]

    struct ProjectModel: Decodable {
        let name: String
        let assigments: [String]
    }
}
