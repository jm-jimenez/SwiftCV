//
//  ResumeNavigation.swift
//  SwiftCV
//
//  Created by José María Jiménez on 19/10/24.
//
import DependencyResolver
import Navigation

struct ResumeNavigation {
    func goToPersonalData() {
        PersonalDataBuilder().build()
        let viewController: PersonalDataViewController = DefaultDependencyResolver.shared.resolve()
        var presenter: PersonalDataPresenterProtocol = DefaultDependencyResolver.shared.resolve()
        presenter.view = viewController
        Navigator.shared.pushVC(viewController)
    }

    func goToExperience() {
        let viewController = ExperienceBuilder().build()
        Navigator.shared.pushVC(viewController)
    }
}
