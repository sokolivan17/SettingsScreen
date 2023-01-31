//
//  ViewController.swift
//  SettingsScreen
//
//  Created by Ваня Сокол on 31.01.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var labelText = [
        "Уведомление",
        "Звуки, тактильные сигналы",
        "Фокусирование",
        "Экранное время",
    ]

    private lazy var cellImage = [
        UIImage(systemName: "bell.badge"),
        UIImage(systemName: "speaker.wave.3"),
        UIImage(systemName: "moon.fill"),
        UIImage(systemName: "hourglass"),
    ]

    private lazy var cellImageColor = [
        UIColor.systemRed,
        UIColor.systemPink,
        UIColor.systemIndigo,
        UIColor.systemIndigo,
    ]

    // MARK: - Outlets

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = false
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - Extension

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        labelText.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        cell.textLabel?.text = labelText[indexPath.row]
        cell.imageView?.image = cellImage[indexPath.row]
        cell.imageView?.backgroundColor = cellImageColor[indexPath.row]
        cell.imageView?.tintColor = .white
        return cell
    }
}

