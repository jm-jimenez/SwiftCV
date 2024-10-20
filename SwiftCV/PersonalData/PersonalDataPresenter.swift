//
//  PersonalDataPresenter.swift
//  SwiftCV
//
//  Created by José María Jiménez on 19/10/24.
//

import DependencyResolver

protocol PersonalDataPresenterProtocol {
    var view: PersonalDataView? { get set }
}

final class PersonalDataPresenter {
    weak var view: PersonalDataView?
}

extension PersonalDataPresenter: PersonalDataPresenterProtocol {

}
