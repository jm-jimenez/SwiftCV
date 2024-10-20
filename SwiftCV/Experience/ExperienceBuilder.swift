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

        registerDependency(GetAllJobsUseCase.self) {
            GetAllJobsUseCase()
        }
        registerDependency(JobsProvider.self) {
            LocalJsonJobsProvider()
        }

        let presenter = ExperiencePresenter()
        let viewController = ExperienceViewController(presenter: presenter)

        presenter.view = viewController

        return viewController
    }
}
