//
//  TableViewCell.swift
//  SettingsScreen
//
//  Created by Ваня Сокол on 31.01.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    // MARK: - Outlets

    private lazy var iconBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "bell.badge")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var settingName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Уведомление"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupHierarcy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarcy() {
        addSubview(iconBackgroundView)
        addSubview(iconImage)
        addSubview(settingName)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconBackgroundView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            iconBackgroundView.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            iconBackgroundView.heightAnchor.constraint(equalToConstant: 20),

            iconImage.centerYAnchor.constraint(equalTo: iconBackgroundView.centerYAnchor),
            iconImage.centerXAnchor.constraint(equalTo: iconBackgroundView.centerXAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 18),

            settingName.leftAnchor.constraint(equalTo: iconBackgroundView.rightAnchor,constant: 10),
            settingName.centerYAnchor.constraint(equalTo: iconBackgroundView.centerYAnchor),
        ])
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
