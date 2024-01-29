//
//  ViewController.swift
//  iOS12-HW13-Alexey Cherebayev
//
//  Created by Alex on 29.01.2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Constants
    private enum Constants {
        
    }
    
    // MARK: - UI
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        return table
    }()
    
    // MARK: - Private variables
    private var models = [Section]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    
    private func setupView() {
        title = "Настройки"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        setupConfigure()
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        
    }
    
    private func setupConfigure() {
        models.append(Section(title: "", options: [
            .switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundIcon: .systemOrange, handler: {
            }, isOn: false)),
            .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundIcon: .systemBlue, handler: {
                self.navigationController?.pushViewController(DetailViewController.newInstance(viewTitle: "Авиарежим", viewImage: UIImage(systemName: "airplane")), animated: true)
            })),
            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "dot.radiowaves.left.and.right"), iconBackgroundIcon: .systemBlue, handler: {
                
            })),
            .staticCell(model: SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundIcon: .systemGreen, handler: {
                
            })),
            .staticCell(model: SettingsOption(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconBackgroundIcon: .systemGreen, handler: {
                
            })),
            .switchCell(model: SettingsSwitchOption(title: "VPN", icon: UIImage(systemName: "network"), iconBackgroundIcon: .systemBlue, handler: {
                
            }, isOn: false)),
        ]))
        
        models.append(Section(title: "", options: [
            .staticCell(model: SettingsOption(title: "Уведомдления", icon: UIImage(systemName: "app.badge"), iconBackgroundIcon: .systemRed, handler: {
                
            })),
            .staticCell(model: SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "speaker.wave.3"), iconBackgroundIcon: .systemRed, handler: {
                
            })),
            .staticCell(model: SettingsOption(title: "Не беспокоить", icon: UIImage(systemName: "moon.fill"), iconBackgroundIcon: .systemBlue, handler: {
                
            })),
            .staticCell(model: SettingsOption(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconBackgroundIcon: .systemBlue, handler: {
                
            })),
        ]))
        
        models.append(Section(title: "", options: [
            .staticCell(model: SettingsOption(title: "Основное", icon: UIImage(systemName: "gear"), iconBackgroundIcon: .systemGray, handler: {
                
            })),
            .staticCell(model: SettingsOption(title: "Пункт управления", icon: UIImage(systemName: "slider.horizontal.3"), iconBackgroundIcon: .systemGray, handler: {
                
            })),
            .staticCell(model: SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "sun.max.fill"), iconBackgroundIcon: .systemBlue, handler: {
                
            })),
            .staticCell(model: SettingsOption(title: "Универсальный доступ", icon: UIImage(systemName: "accessibility"), iconBackgroundIcon: .systemBlue, handler: {
                
            })),
        ]))
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifier,
                for: indexPath
            ) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            
            cell.binding(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            
            cell.binding(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
        
    }
    
}

