//
//  Untitled.swift
//  SwiftCV
//
//  Created by José María Jiménez on 8/11/24.
//

import Utils
import DependencyResolver

final class GetPersonalDataUseCase: UseCase {

    @Injected private var provider: PersonalDataProvider
    @Injected private var appSettings: AppSettingsProtocol

    func execute() async throws -> [SingleDataEntity] {
        let personalData = try await provider.getPersonalData()
        return personalData[appSettings.currentLanguage] ?? []
    }
}
