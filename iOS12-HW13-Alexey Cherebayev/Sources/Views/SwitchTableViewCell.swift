//
//  SwitchTableViewCell.swift
//  iOS12-HW13-Alexey Cherebayev
//
//  Created by Alex on 29.01.2024.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    
    // MARK - Variables

    static let identifier = "SwitchTableViewCell"
    
    // MARK: - UI
    
    lazy var iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.addSubview(iconImageView)
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var optionsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    lazy var optionSwitch: UISwitch = {
        let onSwitch = UISwitch()
        onSwitch.onTintColor = .systemBlue
        return onSwitch
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews([
            optionsLabel,
            iconContainer,
            optionSwitch
        ])
        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        let imageSize: CGFloat = size / 1.5
        iconImageView.frame = CGRect(
            x: (size - imageSize) / 2,
            y: (size - imageSize) / 2,
            width: imageSize,
            height: imageSize
        )
        optionSwitch.sizeToFit()
        optionSwitch.frame = CGRect(
            x: contentView.frame.size.width - optionSwitch.frame.size.width - 20,
            y: (contentView.frame.size.height - optionSwitch.frame.size.height) / 2,
            width: optionSwitch.frame.size.width,
            height: optionSwitch.frame.size.height
        )
        optionsLabel.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.width - 20 - iconContainer.frame.size.width - 10,
            height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        optionsLabel.text = nil
        iconContainer.backgroundColor = nil
        optionSwitch.isOn = false
    }
    
    public func binding(with model: SettingsSwitchOption) {
        optionsLabel.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundIcon
        optionSwitch.isOn = model.isOn
    }
}
