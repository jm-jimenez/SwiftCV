//
//  ResumeViewController.swift
//  SwiftCV
//
//  Created by José María Jiménez on 18/10/24.
//

import UIKit
import Navigation
import DependencyResolver
import Language
import Utils

protocol ResumeView: AnyObject {
    func setCurrentLanguage(_ language: LanguageType)
}

final class ResumeViewController: UIViewController {

    @IBOutlet private weak var languageButton: UIButton!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var profileContainer: UIView!
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var fullName: UILabel!
    @IBOutlet private weak var subtitle: UILabel!
    @IBOutlet private weak var personalDataBtn: UIButton!
    @IBOutlet private weak var jobExperienceBtn: UIButton!
    @IBOutlet private weak var studiesBtn: UIButton!

    @Injected private var presenter: ResumePresenterProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction private func didTapPersonalData(_ sender: UIButton) {
        presenter.goToPersonalData()
    }

    @IBAction private func didTapMyExperience(_ sender: UIButton) {
        presenter.goToExperience()
    }

    @IBAction private func didTapMyStudies(_ sender: UIButton) {
        let alert = UIAlertController(title: String(localized: "Coming soon!"), message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    @IBAction func didTapLanguage(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
}

extension ResumeViewController: ResumeView {
    func setCurrentLanguage(_ language: LanguageType) {
        runInMain {
            self.imageView.image = language.icon
        }
    }
}

private extension ResumeViewController {
    func setupViews() {
        setupProfileImage()
        personalDataBtn.setTitle(String(localized: "My personal data"), for: .normal)
        jobExperienceBtn.setTitle(String(localized: "My job experience"), for: .normal)
        studiesBtn.setTitle(String(localized: "My studies and formation"), for: .normal)
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
