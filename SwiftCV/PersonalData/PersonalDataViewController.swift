//
//  PersonalDataViewController.swift
//  SwiftCV
//
//  Created by José María Jiménez on 18/10/24.
//

import UIKit
import DependencyResolver

protocol PersonalDataView: AnyObject {
    func updatePersonalData(_ models: [PersonalDataModel])
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

    private var models: [PersonalDataModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
}

private extension PersonalDataViewController {
    func setupNavigationBar() {
        title = String(localized: "My personal data")
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PersonalDataCell", bundle: nil), forCellReuseIdentifier: "cellReuse")
    }

    func configureCell(cell: UITableViewCell, indexPath: IndexPath) -> UITableViewCell {
        var conf = cell.defaultContentConfiguration()
        conf.text = models[indexPath.item].key
        conf.secondaryText = models[indexPath.item].value
        cell.contentConfiguration = conf
        return cell
    }
}

extension PersonalDataViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuse", for: indexPath) as? PersonalDataCell
        else { return UITableViewCell() }
        cell.configure(with: models[indexPath.item])
        return cell
    }
}

extension PersonalDataViewController: PersonalDataView {
    func updatePersonalData(_ models: [PersonalDataModel]) {
        self.models = models
    }
}
