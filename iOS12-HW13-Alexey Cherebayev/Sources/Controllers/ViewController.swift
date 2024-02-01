//
//  ViewController.swift
//  iOS12-HW13-Alexey Cherebayev
//
//  Created by Alex on 29.01.2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
    // MARK: - Constants
    
    private enum Constants {
        
    }
    
    // MARK: - UI
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped) // ну у меня на айфоне во всяком случае так
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        return table
    }()
    
    // MARK: - Private variables
    private var data = Section.getData()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
    }
    
    // MARK: - Setups
    
    private func setupView() {
        title = "Настройки"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = data[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifier,
                for: indexPath
            ) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: model)
            cell.selector = {
                let detailsViewController = DetailViewController()
                detailsViewController.viewTitle = model.title
                detailsViewController.viewImage = model.icon
                detailsViewController.imageColor = model.iconBackgroundColor
                self.navigationController?.pushViewController(detailsViewController, animated: true)
            }
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: model)
            return cell
        }
    }
}

