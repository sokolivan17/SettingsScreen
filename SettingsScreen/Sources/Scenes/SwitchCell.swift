//
//  SwitchCell.swift
//  SettingsScreen
//
//  Created by Ваня Сокол on 04.02.2023.
//

import UIKit

class SwitchCell: TableViewCell {

    // MARK: - Outlets

    private lazy var switching: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .systemOrange
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }()

    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .none
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
        addSubview(switching)
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

            switching.rightAnchor.constraint(equalTo: rightAnchor,constant: -10),
            switching.centerYAnchor.constraint(equalTo: iconBackgroundView.centerYAnchor)
        ])
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        iconBackgroundView.backgroundColor = nil
        iconImage.image = nil
        settingName.text = nil
        switching.isOn = false
    }
}
