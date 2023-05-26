//
//  DetailViewController.swift
//  SettingsScreen
//
//  Created by Ваня Сокол on 05.02.2023.
//

import UIKit

class DetailViewController: UIViewController {

    var models: SettingsOption?

    private func fillSettings() {
        iconBackgroundView.backgroundColor = models?.iconBackgroundColor
        iconImage.image = models?.icon
        settingName.text = models?.title
    }

    // MARK: - Outlets

    private lazy var iconBackgroundView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var settingName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        fillSettings()
        backToRootViewController()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(iconBackgroundView)
        view.addSubview(iconImage)
        view.addSubview(settingName)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iconBackgroundView.heightAnchor.constraint(equalToConstant: 300),
            iconBackgroundView.widthAnchor.constraint(equalToConstant: 300),

            iconImage.centerXAnchor.constraint(equalTo: iconBackgroundView.centerXAnchor),
            iconImage.centerYAnchor.constraint(equalTo: iconBackgroundView.centerYAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 280),
            iconImage.widthAnchor.constraint(equalToConstant: 280),

            settingName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingName.topAnchor.constraint(equalTo: iconBackgroundView.bottomAnchor,constant: 20),
        ])
    }

    private func backToRootViewController() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
