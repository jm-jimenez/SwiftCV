//
//  PersonalDataModel.swift
//  SwiftCV
//
//  Created by José María Jiménez on 8/11/24.
//

final class PersonalDataModel {
    let key: String
    let value: String
    let action: (() -> Void)?

    init(key: String, value: String, action: (() -> Void)? = nil) {
        self.key = key
        self.value = value
        self.action = action
    }
}
