//
//  ViewController.swift
//  SettingsScreen
//
//  Created by Ваня Сокол on 31.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var models = Section.getSettingsCell()

    // MARK: - Outlets

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(BaseCell.self, forCellReuseIdentifier: BaseCell.identifierBaseCell)
        tableView.register(NotificationCell.self, forCellReuseIdentifier: NotificationCell.identifierNotificationCell)
        tableView.register(SwitchCell.self, forCellReuseIdentifier: SwitchCell.identifierSwitchCell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
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

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]

        switch model.typeCell {

        case .staticCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: BaseCell.identifierBaseCell, for: indexPath) as? BaseCell
            cell?.configure(model: model)
            return cell ?? UITableViewCell()
        case .switchCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: SwitchCell.identifierSwitchCell, for: indexPath) as? SwitchCell
            cell?.configure(model: model)
            return cell ?? UITableViewCell()
        case .notificationCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationCell.identifierNotificationCell, for: indexPath) as? NotificationCell
            cell?.configure(model: model)
            return cell ?? UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models[indexPath.section].options[indexPath.row]

        switch model.typeCell {
        case .staticCell:
            print("Нажата ячейка \(model.title)")
        case .switchCell:
            print("Нажата ячейка \(model.title)")
        case .notificationCell:
            print("Нажата ячейка \(model.title)")
        }

        let viewController = DetailViewController()
        tableView.deselectRow(at: indexPath, animated: true)
        viewController.models = model
        navigationController?.pushViewController(viewController, animated: true)
    }
}

