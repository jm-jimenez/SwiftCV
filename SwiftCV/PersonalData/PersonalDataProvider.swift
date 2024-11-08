//
//  PersonalDataProvider.swift
//  SwiftCV
//
//  Created by José María Jiménez on 8/11/24.
//

import DependencyResolver
import Foundation
import Language

protocol PersonalDataProvider: InjectableCapable {
    func getPersonalData() async throws -> [LanguageType: [SingleDataEntity]]
}

struct LocalJsonPersonalDataProvider: PersonalDataProvider {
    func getPersonalData() async throws -> [LanguageType: [SingleDataEntity]] {
        guard let path = Bundle.main.path(forResource: "personal-data", ofType: "json") else {
            throw CocoaError(.fileReadNoSuchFile)
        }
        let url = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: url)
        let decoded = try JSONDecoder().decode([String: [SingleDataEntity]].self, from: data)
        return decoded.reduce([:]) { partialResult, current in
            guard let language = LanguageType(rawValue: current.key) else {
                return partialResult
            }
            var aux = partialResult
            aux[language] = current.value
            return aux
        }
    }
}
