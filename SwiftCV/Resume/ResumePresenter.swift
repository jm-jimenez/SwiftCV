//
//  ResumePresenter.swift
//  SwiftCV
//
//  Created by José María Jiménez on 19/10/24.
//

import DependencyResolver

protocol ResumePresenterProtocol {
    func viewDidLoad()
    func goToPersonalData()
    func goToExperience()
}

final class ResumePresenter: InjectableCapable {
    weak var view: ResumeView?
    @Injected private var navigation: ResumeNavigation
    @Injected private var getCurrentLanguageUseCase: GetCurrentLanguageUseCase
}

extension ResumePresenter: ResumePresenterProtocol {
    func viewDidLoad() {
        Task { [weak self] in
            let language = try await self?.getCurrentLanguageUseCase.execute()
            guard let language else { return }
            self?.view?.setCurrentLanguage(language)
        }
    }

    func goToPersonalData() {
        navigation.goToPersonalData()
    }

    func goToExperience() {
        navigation.goToExperience()
    }
}
