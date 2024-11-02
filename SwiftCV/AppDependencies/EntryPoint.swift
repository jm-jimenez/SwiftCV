//
//  EntryPoint.swift
//  SwiftCV
//
//  Created by José María Jiménez on 2/11/24.
//

import UIKit
import DependencyResolver
import Navigation

protocol EntryPointProtocol {
    func getEntryPointViewController() -> UIViewController
}

final class EntryPoint: EntryPointProtocol, InjectableCapable {

    init() {
        registerDependencies()
    }

    func getEntryPointViewController() -> UIViewController {
        let presenter = ResumePresenter()
        let viewController = ResumeViewController(presenter: presenter)
        presenter.view = viewController
        return viewController
    }
}

private extension EntryPoint {
    func registerDependencies() {
        registerDependency(NavigationCapable.self, ResumeNavigator.self)
        registerDependency(GetCurrentLanguageUseCase.self, GetCurrentLanguageUseCase.self)
    }
}
