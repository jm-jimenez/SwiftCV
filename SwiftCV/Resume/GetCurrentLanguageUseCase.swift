//
//  GetCurrentLanguageUseCase.swift
//  SwiftCV
//
//  Created by José María Jiménez on 31/10/24.
//

import Utils
import Language
import DependencyResolver

struct GetCurrentLanguageUseCase: UseCase {

    @Injected var appSettings: AppSettingsProtocol

    func execute() async throws -> LanguageType {
        return appSettings.currentLanguage
    }
}
