//
//  AppDependencies.swift
//  SwiftCV
//
//  Created by José María Jiménez on 31/10/24.
//

import DependencyResolver

final class AppDependencies {
    let appSettings = AppSettings()

    init() {
        registerDependencies()
    }
}

private extension AppDependencies {
    func registerDependencies() {
        registerDependency(AppSettingsProtocol.self) {
            self.appSettings
        }
    }
}
