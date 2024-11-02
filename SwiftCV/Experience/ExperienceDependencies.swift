//
//  ExperienceDependencies.swift
//  SwiftCV
//
//  Created by José María Jiménez on 20/10/24.
//

import DependencyResolver
import UIKit

struct ExperienceDependencies {
    func registerDependencies() {
        registerDependency(GetAllJobsUseCase.self, GetAllJobsUseCase.self)
        registerDependency(JobsProvider.self, LocalJsonJobsProvider.self)
    }
}
