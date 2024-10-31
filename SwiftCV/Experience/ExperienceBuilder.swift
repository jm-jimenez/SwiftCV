//
//  ExperienceBuilder.swift
//  SwiftCV
//
//  Created by José María Jiménez on 20/10/24.
//

import DependencyResolver
import UIKit

struct ExperienceBuilder {
    func build() -> UIViewController {

        registerDependency(GetAllJobsUseCase.self, GetAllJobsUseCase.self)
        registerDependency(JobsProvider.self, LocalJsonJobsProvider.self)

        let presenter = ExperiencePresenter()
        let viewController = ExperienceViewController(presenter: presenter)

        presenter.view = viewController

        return viewController
    }
}
