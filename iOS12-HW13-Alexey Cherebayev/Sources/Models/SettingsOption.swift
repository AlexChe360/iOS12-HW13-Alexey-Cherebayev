//
//  SettingsOption.swift
//  iOS12-HW13-Alexey Cherebayev
//
//  Created by Alex on 29.01.2024.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundIcon: UIColor
    var isOn: Bool
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
}

extension Section {
    static func getData() -> [Section] {
        var models = [Section]()
        models.append(Section(title: "", options: [
            .switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundIcon: .systemOrange, isOn: false)),
            .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemBlue)),
            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "dot.radiowaves.left.and.right"), iconBackgroundColor: .systemBlue)),
            .staticCell(model: SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen)),
            .staticCell(model: SettingsOption(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen)),
            .switchCell(model: SettingsSwitchOption(title: "VPN", icon: UIImage(systemName: "network"), iconBackgroundIcon: .systemBlue, isOn: false)),
        ]))
        
        models.append(Section(title: "", options: [
            .staticCell(model: SettingsOption(title: "Уведомдления", icon: UIImage(systemName: "app.badge"), iconBackgroundColor: .systemRed)),
            .staticCell(model: SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "speaker.wave.3"), iconBackgroundColor: .systemRed)),
            .staticCell(model: SettingsOption(title: "Не беспокоить", icon: UIImage(systemName: "moon.fill"), iconBackgroundColor: .systemBlue)),
            .staticCell(model: SettingsOption(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemBlue)),
        ]))
        
        models.append(Section(title: "", options: [
            .staticCell(model: SettingsOption(title: "Основное", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray)),
            .staticCell(model: SettingsOption(title: "Пункт управления", icon: UIImage(systemName: "slider.horizontal.3"), iconBackgroundColor: .systemGray)),
            .staticCell(model: SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "sun.max.fill"), iconBackgroundColor: .systemBlue)),
            .staticCell(model: SettingsOption(title: "Универсальный доступ", icon: UIImage(systemName: "accessibility"), iconBackgroundColor: .systemBlue)),
        ]))
        
        return models
    }
}
