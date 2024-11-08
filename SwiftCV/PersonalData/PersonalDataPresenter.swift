//
//  PersonalDataPresenter.swift
//  SwiftCV
//
//  Created by José María Jiménez on 19/10/24.
//

import DependencyResolver
import UIKit
import Foundation
import Utils

protocol PersonalDataPresenterProtocol {
    var view: PersonalDataView? { get set }
    func viewDidLoad()
}

final class PersonalDataPresenter {
    weak var view: PersonalDataView?
    @Injected private var getPersonalDataUseCase: GetPersonalDataUseCase
    private var cancellable: Task<Void, Never>?

    deinit {
        cancellable?.cancel()
    }
}

extension PersonalDataPresenter: PersonalDataPresenterProtocol {

    func viewDidLoad() {
        cancellable = Task { [weak self] in
            do {
                let personalData = try await self?.getPersonalDataUseCase.execute()
                guard let personalData else { return }
                let models = personalData.map { PersonalDataModel(key: $0.field,
                                                     value: $0.value,
                                                     action: ActionParser.parse($0.action, value: $0.value)) }
                runInMain {
                    self?.view?.updatePersonalData(models)
                }
            } catch {

            }
        }
    }
}

struct ActionParser {
    enum Actions {
        case openUrl(_ url: String)
        case mailTo(_ address: String)

        init?(_ rawValue: String, value: String) {
            switch rawValue {
            case "OPEN_URL": self = .openUrl(value)
            case "OPEN_EMAIL": self = .mailTo(value)
            default: return nil
            }
        }
    }

    static func parse(_ action: String?, value: String) -> (() -> Void)? {
        guard let action,
              let action = Actions(action, value: value)
        else { return nil }
        switch action {
        case .openUrl: return { UIApplication.shared.open(URL(string: value)!) }
        case .mailTo: return { UIApplication.shared.open(URL(string: "mailto:\(value)")!) }
        }
    }
}
