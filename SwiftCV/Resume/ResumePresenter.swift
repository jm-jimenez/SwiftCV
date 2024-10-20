//
//  ResumePresenter.swift
//  SwiftCV
//
//  Created by José María Jiménez on 19/10/24.
//

import DependencyResolver

protocol ResumePresenterProtocol {
    func goToPersonalData()
}

final class ResumePresenter {
    @Injected private var navigation: ResumeNavigation
}

extension ResumePresenter: ResumePresenterProtocol {
    func goToPersonalData() {
        navigation.goToPersonalData()
    }
}
