//
//  ExperienceMocks.swift
//  SwiftCV
//
//  Created by José María Jiménez on 20/10/24.
//

@testable import SwiftCV
import Foundation
import Language

final class ExperienceViewMock: ExperienceView {
    var completion: (([JobModel]) -> Void)?

    func updateJobs(with jobs: [JobModel]) {
        completion?(jobs)
    }
}

final class JobsProviderMock: JobsProvider {
    var result: Result<[LanguageType: [JobModel]], Error>?

    func getAllJobs() async throws -> [LanguageType: [JobModel]] {
        guard let result, case .success(let success) = result else {
            throw CocoaError(.fileReadCorruptFile)
        }
        return success
    }
}

extension JobModel {
    static let testSuite = [LanguageType.english: [JobModel(company: "test",
                                     date: "test",
                                     description: "test",
                                     projects: [])]]
}
