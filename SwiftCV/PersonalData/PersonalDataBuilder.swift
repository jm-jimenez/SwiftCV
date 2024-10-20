//
//  PersonalDataBuilder.swift
//  SwiftCV
//
//  Created by José María Jiménez on 19/10/24.
//

import DependencyResolver

struct PersonalDataBuilder {
    func build() {
        registerDependency(PersonalDataPresenterProtocol.self) {
            PersonalDataPresenter()
        }
        registerDependency(PersonalDataViewController.self) {
            PersonalDataViewController()
        }
    }
}
