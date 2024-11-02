//
//  ResumeNavigator.swift
//  SwiftCV
//
//  Created by José María Jiménez on 1/11/24.
//

import Navigation
import DependencyResolver
import UIKit

final class ResumeNavigator: NavigationCapable {
    func provideNavigationFor(_ destination: Destination) -> UIViewController? {
        guard let destination = destination as? Destinations else { return nil }
        switch destination {
        case .personalData:
            return buildPersonalDataDestination()
        case .experience:
            return buildExperienceDestination()
        }
    }
}

extension ResumeNavigator {
    enum Destinations: Destination {
        case personalData
        case experience
    }

    func buildPersonalDataDestination() -> UIViewController {
        PersonalDataBuilder().build()
        do {
            let viewController: PersonalDataViewController = try DefaultDependencyResolver.shared.resolve()
            var presenter: PersonalDataPresenterProtocol = try DefaultDependencyResolver.shared.resolve()
            presenter.view = viewController
            return viewController
        } catch {
            fatalError()
        }
    }

    func buildExperienceDestination() -> UIViewController {
        ExperienceDependencies().registerDependencies()
        let presenter = ExperiencePresenter()
        let viewController = ExperienceViewController(presenter: presenter)
        presenter.view = viewController
        return viewController
    }
}
