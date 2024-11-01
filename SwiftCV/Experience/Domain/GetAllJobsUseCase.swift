//
//  GetAllJobsUseCase.swift
//  SwiftCV
//
//  Created by José María Jiménez on 20/10/24.
//

import DependencyResolver
import Utils

final class GetAllJobsUseCase: UseCase {

    @Injected private var provider: JobsProvider
    @Injected private var appSettings: AppSettingsProtocol

    func execute() async throws -> [JobModel] {
        let result = try await provider.getAllJobs()
        return result[appSettings.currentLanguage] ?? []
    }
}
