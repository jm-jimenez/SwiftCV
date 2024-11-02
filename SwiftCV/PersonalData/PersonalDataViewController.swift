//
//  PersonalDataViewController.swift
//  SwiftCV
//
//  Created by José María Jiménez on 18/10/24.
//

import UIKit
import DependencyResolver

protocol PersonalDataView: AnyObject {

}

final class PersonalDataViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    private var presenter: PersonalDataPresenterProtocol

    init(presenter: PersonalDataPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: "PersonalDataViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let data: [(key: String, value: String)] = [
        ("Name", "José María"),
        ("Surname", "Jiménez Pérez"),
        ("Birth", "03-05-1988"),
        ("DNI", "52002944J"),
        ("Address", "**** 5"),
        ("City", "28*** ***drid"),
        ("Email", "josemariajimenezperez@gmail.com"),
        ("GitHub", "https://www.github.com/jm-jimenez")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

private extension PersonalDataViewController {
    func setupNavigationBar() {
        title = String(localized: "My personal data")
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    func configureCell(cell: UITableViewCell, indexPath: IndexPath) -> UITableViewCell {
        var conf = cell.defaultContentConfiguration()
        conf.text = data[indexPath.item].key
        conf.secondaryText = data[indexPath.item].value
        cell.contentConfiguration = conf
        return cell
    }
}

extension PersonalDataViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuse") else {
            let cell = UITableViewCell(style: .value2, reuseIdentifier: "cellReuse")
            return configureCell(cell: cell, indexPath: indexPath)
        }
        return configureCell(cell: cell, indexPath: indexPath)
    }
}

extension PersonalDataViewController: PersonalDataView { }
