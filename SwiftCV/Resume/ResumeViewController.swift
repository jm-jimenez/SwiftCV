//
//  ResumeViewController.swift
//  SwiftCV
//
//  Created by José María Jiménez on 18/10/24.
//

import UIKit
import Navigation
import DependencyResolver

final class ResumeViewController: UIViewController {

    @IBOutlet private weak var profileContainer: UIView!
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var fullName: UILabel!
    @IBOutlet private weak var subtitle: UILabel!

    @Injected private var presenter: ResumePresenterProtocol
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    @IBAction private func didTapPersonalData(_ sender: UIButton) {
        presenter.goToPersonalData()
    }

    @IBAction private func didTapMyExperience(_ sender: UIButton) {
        presenter.goToExperience()
    }

    @IBAction private func didTapMyStudies(_ sender: UIButton) {
        let alert = UIAlertController(title: "Coming soon!", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

private extension ResumeViewController {
    func setupViews() {
        setupProfileImage()
    }

    func setupProfileImage() {
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.image = UIImage(named: "profile.jpeg")
        profileContainer.clipsToBounds = false
        profileContainer.layer.shadowColor = UIColor.black.cgColor
        profileContainer.layer.shadowOpacity = 0.7
        profileContainer.layer.shadowOffset = CGSize(width: 2, height: 2)
        profileContainer.layer.shadowRadius = 8
        profileContainer.layer.cornerRadius = profileContainer.frame.width / 2
    }
}
