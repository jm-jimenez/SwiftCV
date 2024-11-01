//
//  Untitled.swift
//  SwiftCV
//
//  Created by José María Jiménez on 20/10/24.
//

import Foundation
import DependencyResolver
import Language

protocol JobsProvider: InjectableCapable {
    func getAllJobs() async throws -> [LanguageType: [JobModel]]
}

struct LocalJsonJobsProvider: JobsProvider {
    func getAllJobs() async throws -> [LanguageType: [JobModel]] {
        guard let path = Bundle.main.path(forResource: "jobs", ofType: "json") else {
            throw CocoaError(.fileReadNoSuchFile)
        }
        let url = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: url)
        let decoded = try JSONDecoder().decode([String: [JobModel]].self, from: data)
        return decoded.reduce([:]) { partialResult, current in
            guard let type = LanguageType(rawValue: current.key) else { return partialResult }
            var aux = partialResult
            aux[type] = current.value
            return aux
        }
    }
}
