//
//  GetAllJobsUseCase.swift
//  SwiftCV
//
//  Created by José María Jiménez on 20/10/24.
//

import DependencyResolver
import Utils

struct GetAllJobsUseCase: UseCase {

    @Injected private var provider: JobsProvider

    func execute() async throws -> [JobModel] {
        return try await provider.getAllJobs()
    }
}
