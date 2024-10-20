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
        let vc = ExperienceViewController(presenter: presenter)

        presenter.view = vc

        return vc
    }
}
