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
        let vc: PersonalDataViewController = DefaultDependencyResolver.shared.resolve()
        var presenter: PersonalDataPresenterProtocol = DefaultDependencyResolver.shared.resolve()
        presenter.view = vc
        Navigator.shared.pushVC(vc)
    }
}
