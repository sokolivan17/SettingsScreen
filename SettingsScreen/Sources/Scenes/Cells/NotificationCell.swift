//
//  NotificationCell.swift
//  SettingsScreen
//
//  Created by Ваня Сокол on 04.02.2023.
//

import UIKit

class NotificationCell: BaseCell {

    static let identifierNotificationCell = "NotificationCell"

    // MARK: - Outlets

    private lazy var notificationView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 13
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var notificationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.textColor = .white
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
        addSubview(notificationView)
        addSubview(notificationLabel)
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

            notificationView.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
            notificationView.centerYAnchor.constraint(equalTo: iconBackgroundView.centerYAnchor),
            notificationView.heightAnchor.constraint(equalToConstant: 26),
            notificationView.widthAnchor.constraint(equalToConstant: 26),

            notificationLabel.centerXAnchor.constraint(equalTo: notificationView.centerXAnchor),
            notificationLabel.centerYAnchor.constraint(equalTo: notificationView.centerYAnchor),
        ])
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        iconBackgroundView.backgroundColor = nil
        iconImage.image = nil
        settingName.text = nil
        notificationLabel.text = nil
    }

    override public func configure(model: SettingsOption) {
        super.configure(model: model)
        notificationLabel.text = model.notificationNum
        notificationView.backgroundColor = model.notificationBackgroundColor
    }
}
