//
//  ExperienceViewController.swift
//  SwiftCV
//
//  Created by José María Jiménez on 19/10/24.
//

import UIKit

final class ExperienceViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    private let data: [(key: String, value: String)] = [
        ("Plexus", "March 2023 - Now"),
        ("Experis", "March 2021 - March 2023")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
    }
}

private extension ExperienceViewController {
    func setupNavigationBar() {
        title = "My job experience"
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuse", for: indexPath) as? ExpandableJobCell else { return ExpandableJobCell() }
        return cell
    }
}
