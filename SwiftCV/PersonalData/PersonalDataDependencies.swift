//
//  PersonalDataDependencies.swift
//  SwiftCV
//
//  Created by José María Jiménez on 19/10/24.
//

import DependencyResolver

struct PersonalDataDependencies {
    func registerDependencies() {
        registerDependency(PersonalDataProvider.self, LocalJsonPersonalDataProvider.self)
        registerDependency(GetPersonalDataUseCase.self, GetPersonalDataUseCase.self)
    }
}
