//
//  ExperienceViewController.swift
//  SwiftCV
//
//  Created by José María Jiménez on 19/10/24.
//

import UIKit
import DependencyResolver
import Language

protocol ExperienceView: AnyObject {
    func updateJobs(with jobs: [JobModel])
}

final class ExperienceViewController: UIViewController {

    private var presenter: ExperiencePresenterProtocol

    @IBOutlet private weak var tableView: UITableView!

    init(presenter: ExperiencePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: "ExperienceViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var data: [JobModel] = [] {
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

private extension ExperienceViewController {
    func setupNavigationBar() {
        title = String(localized: "My job experience")
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "ExpandableJobCell", bundle: nil), forCellReuseIdentifier: "cellReuse")
    }
}

extension ExperienceViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next line_length
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuse", for: indexPath) as? ExpandableJobCell else {
            return ExpandableJobCell()
        }
        cell.configureJob(data[indexPath.item])
        return cell
    }
}

extension ExperienceViewController: ExperienceView {
    func updateJobs(with jobs: [JobModel]) {
        data = jobs
    }
}
