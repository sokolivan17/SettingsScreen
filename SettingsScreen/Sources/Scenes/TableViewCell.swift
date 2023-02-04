//
//  TableViewCell.swift
//  SettingsScreen
//
//  Created by Ваня Сокол on 31.01.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    // MARK: - Outlets

    lazy var iconBackgroundView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var settingName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var detailText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        contentView.clipsToBounds = true
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
        addSubview(detailText)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconBackgroundView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            iconBackgroundView.topAnchor.constraint(equalTo: topAnchor,constant: 7),
            iconBackgroundView.heightAnchor.constraint(equalToConstant: 30),
            iconBackgroundView.widthAnchor.constraint(equalToConstant: 30),

            iconImage.centerYAnchor.constraint(equalTo: iconBackgroundView.centerYAnchor),
            iconImage.centerXAnchor.constraint(equalTo: iconBackgroundView.centerXAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 20),

            settingName.leftAnchor.constraint(equalTo: iconBackgroundView.rightAnchor,constant: 10),
            settingName.centerYAnchor.constraint(equalTo: iconBackgroundView.centerYAnchor),

            detailText.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            detailText.centerYAnchor.constraint(equalTo: iconBackgroundView.centerYAnchor),
        ])
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        iconBackgroundView.backgroundColor = nil
        iconImage.image = nil
        settingName.text = nil
    }
}
