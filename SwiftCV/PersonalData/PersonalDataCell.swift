//
//  PersonalDataCell.swift
//  SwiftCV
//
//  Created by José María Jiménez on 8/11/24.
//

import UIKit

final class PersonalDataCell: UITableViewCell {

    @IBOutlet private weak var keyLbl: UILabel!
    @IBOutlet private weak var valueLbl: UILabel!
    @IBOutlet private weak var actionBtn: UIButton!

    private var action: (() -> Void)?

    func configure(with model: PersonalDataModel) {
        keyLbl.text = model.key
        valueLbl.text = model.value
        actionBtn.isHidden = model.action == nil
        action = model.action

        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapCell)))
    }
}

private extension PersonalDataCell {
    @objc func didTapCell() {
        action?()
    }
}
