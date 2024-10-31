//
//  Untitled.swift
//  SwiftCV
//
//  Created by José María Jiménez on 20/10/24.
//

import Foundation
import DependencyResolver

protocol JobsProvider: InjectableCapable {
    func getAllJobs() async throws -> [JobModel]
}

struct LocalJsonJobsProvider: JobsProvider {
    func getAllJobs() async throws -> [JobModel] {
        guard let path = Bundle.main.path(forResource: "jobs", ofType: "json") else {
            throw CocoaError(.fileReadNoSuchFile)
        }
        let url = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: url)
        let decoded = try JSONDecoder().decode(GetAllJobsResponse.self, from: data)
        return decoded.jobs
    }
}
