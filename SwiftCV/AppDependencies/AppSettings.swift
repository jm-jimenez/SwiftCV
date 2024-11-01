//
//  AppSettings.swift
//  SwiftCV
//
//  Created by José María Jiménez on 31/10/24.
//

import Foundation
import Language

protocol AppSettingsProtocol {
    var currentLanguage: LanguageType { get set }
}

final class AppSettings: AppSettingsProtocol {
    var currentLanguage: LanguageType = LanguageType(identifier: Locale.preferredLanguages.first ?? "") ?? .english
}
