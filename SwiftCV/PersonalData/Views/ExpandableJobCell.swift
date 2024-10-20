//
//  ExpandableJobCell.swift
//  SwiftCV
//
//  Created by José María Jiménez on 20/10/24.
//

import UIKit
import Utils

final class ExpandableJobCell: UITableViewCell {

    @IBOutlet private weak var toggleButton: UIButton!
    @IBOutlet private weak var descriptionContainer: UIStackView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var containerView: UIStackView!

    private var isExpanded = false {
        didSet {
            guard let tableView = superview as? UITableView else { return }
            tableView.performBatchUpdates {
                UIView.animate(withDuration: 0.2) {
                    self.containerView.isHidden = !self.isExpanded
                    self.descriptionContainer.isHidden = self.isExpanded
                    self.toggleButton.imageView?.transform = self.isExpanded ? CGAffineTransform(rotationAngle: .pi * 180) : .identity
                    self.contentView.layoutIfNeeded()
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    @IBAction func didTapToggle(_ sender: UIButton) {
        isExpanded.toggle()
    }
}

private extension ExpandableJobCell {
    func setupViews() {
        containerView.isHidden = true
        descriptionLabel.isHidden = false
    }
}
