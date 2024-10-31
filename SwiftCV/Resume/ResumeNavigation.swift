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
        do {
            let viewController: PersonalDataViewController = try DefaultDependencyResolver.shared.resolve()
            var presenter: PersonalDataPresenterProtocol = try DefaultDependencyResolver.shared.resolve()
            presenter.view = viewController
            Navigator.shared.pushVC(viewController)
        } catch {
            fatalError()
        }
    }

    func goToExperience() {
        let viewController = ExperienceBuilder().build()
        Navigator.shared.pushVC(viewController)
    }
}
