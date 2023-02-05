//
//  Model.swift
//  SettingsScreen
//
//  Created by Ваня Сокол on 04.02.2023.
//

import UIKit

struct Section {
    let options: [SettingsOption]
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var mode: String?
    var isOn: Bool?
    var notificationBackgroundColor: UIColor?
    var notificationNum: String?
    var typeCell: SettingsType
}

enum SettingsType {
    case staticCell
    case switchCell
    case notificationCell
}

extension Section {
    static func getSettingsCell() -> [Section] {
    return [
            Section(options: [
                SettingsOption(
                    title: "Авиарежим",
                    icon: UIImage(systemName: "airplane"),
                    iconBackgroundColor: .systemOrange,
                    isOn: false,
                    typeCell: .switchCell),
                SettingsOption(
                    title: "Wi-Fi",
                    icon: UIImage(systemName: "wifi"),
                    iconBackgroundColor: .link,
                    mode: "Не подключен",
                    typeCell: .staticCell),
                SettingsOption(
                    title: "Bluetooth",
                    icon: UIImage(systemName: "b.square"),
                    iconBackgroundColor: .link,
                    mode: "Выкл.",
                    typeCell: .staticCell),
                SettingsOption(
                    title: "Сотовая связь",
                    icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                    iconBackgroundColor: .systemGreen,
                    typeCell: .staticCell),
                SettingsOption(
                    title: "Режим модема",
                    icon: UIImage(systemName: "personalhotspot"),
                    iconBackgroundColor: .systemGreen,
                    typeCell: .staticCell),
                SettingsOption(
                    title: "VPN",
                    icon: UIImage(systemName: "network"),
                    iconBackgroundColor: .link,
                    isOn: false,
                    typeCell: .switchCell)
            ]),
            Section(options: [
                SettingsOption(
                    title: "Уведомление",
                    icon: UIImage(systemName: "bell.badge.fill"),
                    iconBackgroundColor: .systemRed,
                    typeCell: .staticCell),
                SettingsOption(
                    title: "Звуки, тактильные сигналы",
                    icon: UIImage(systemName: "speaker.wave.3.fill"),
                    iconBackgroundColor: .systemPink,
                    typeCell: .staticCell),
                SettingsOption(
                    title: "Фокусирование",
                    icon: UIImage(systemName: "moon.fill"),
                    iconBackgroundColor: .systemIndigo,
                    typeCell: .staticCell),
                SettingsOption(
                    title: "Экранное время",
                    icon: UIImage(systemName: "hourglass"),
                    iconBackgroundColor: .systemIndigo,
                    typeCell: .staticCell)
            ]),
            Section(options: [
                SettingsOption(
                    title: "Основные",
                    icon: UIImage(systemName: "gear"),
                    iconBackgroundColor: .systemGray,
                    notificationBackgroundColor: #colorLiteral(red: 0.9156391025, green: 0.30392766, blue: 0.2372845709, alpha: 1),
                    notificationNum: "1",
                    typeCell: .notificationCell),
                SettingsOption(
                    title: "Пункт управления",
                    icon: UIImage(systemName: "switch.2"),
                    iconBackgroundColor: .systemGray,
                    typeCell: .staticCell),
                SettingsOption(
                    title: "Экран и яркость",
                    icon: UIImage(systemName: "textformat.size"),
                    iconBackgroundColor: .systemBlue,
                    typeCell: .staticCell),
                SettingsOption(
                    title: "Экран Домой",
                    icon: UIImage(systemName: "checkerboard.rectangle"),
                    iconBackgroundColor: .systemBlue,
                    typeCell: .staticCell),
                SettingsOption(
                    title: "Универсальный доступ",
                    icon: UIImage(systemName: "figure.wave.circle.fill"),
                    iconBackgroundColor: .systemBlue,
                    typeCell: .staticCell)
            ])
        ]
    }
}
