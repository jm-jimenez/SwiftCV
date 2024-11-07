//
//  ExpandableJobCell.swift
//  SwiftCV
//
//  Created by José María Jiménez on 20/10/24.
//

import UIKit
import Utils

final class ExpandableJobCell: UITableViewCell {

    @IBOutlet private weak var expandableContentStack: UIStackView!
    @IBOutlet private weak var companyLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
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
                    if self.isExpanded {
                        self.toggleButton.imageView?.transform = CGAffineTransform(rotationAngle: .pi)
                    } else {
                        self.toggleButton.imageView?.transform = .identity
                    }
                    self.contentView.layoutIfNeeded()
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    func configureJob(_ job: JobModel) {
        companyLabel.text = job.company
        dateLabel.text = job.date
        descriptionLabel.text = job.description
        expandableContentStack.setCustomSpacing(7, after: descriptionContainer)
        createProjectViews(job)
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

    func createProjectViews(_ job: JobModel) {
        let views = job.projects.map { project in
            let stackView = createJobStackView()
            let childStackView = UIStackView()
            childStackView.axis = .vertical
            stackView.addArrangedSubview(childStackView)
            let label = createProjectLabel(project)
            childStackView.addArrangedSubview(label)
            childStackView.setCustomSpacing(7, after: label)
            let assigmentStackViewContainer = UIStackView()
            assigmentStackViewContainer.axis = .horizontal
            childStackView.addArrangedSubview(assigmentStackViewContainer)
            assigmentStackViewContainer.addHorizontalSpacer(width: 8)
            let assigmentsStackView = UIStackView()
            assigmentsStackView.spacing = 4
            assigmentsStackView.axis = .vertical
            assigmentStackViewContainer.addArrangedSubview(assigmentsStackView)
            project.assigments.forEach {
                addAssigmentLabel($0, into: assigmentsStackView)
            }
            return stackView
        }

        views.forEach { containerView.addArrangedSubview($0) }
    }

    func createJobStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.addHorizontalSpacer(width: 8)
        let childStackView = UIStackView()
        childStackView.axis = .vertical
        return stackView
    }

    func createProjectLabel(_ project: JobModel.ProjectModel) -> UILabel {
        let label = UILabel()
        label.text = project.name
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }

    func addAssigmentLabel(_ assigment: String, into assigmentsStackView: UIStackView) {
        let label = UILabel()
        label.text = assigment
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .secondaryLabel
        assigmentsStackView.addArrangedSubview(label)
    }
}
