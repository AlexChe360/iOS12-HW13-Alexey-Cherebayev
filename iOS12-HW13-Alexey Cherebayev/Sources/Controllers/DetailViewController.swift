//
//  DetailViewController.swift
//  iOS12-HW13-Alexey Cherebayev
//
//  Created by Alex on 29.01.2024.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var viewTitle: String? = nil
    var viewImage: UIImage? = nil
    var imageColor: UIColor? = nil
    
    // MARK: - UI
    
    private lazy var pictureView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.addSubview(pictureImageView)
        view.backgroundColor = imageColor
        return view
    }()
    
    private lazy var pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = viewImage
        imageView.tintColor = UIColor.white
        return imageView
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHeirarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        title = viewTitle
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.view.backgroundColor = .systemBackground
    }
    
    private func setupHeirarchy() {
        view.addSubviews([
            pictureView
        ])
    }
    
    private func setupLayout() {
        pictureView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.width.height.equalTo(300)
        }
        pictureImageView.snp.makeConstraints { make in
            make.centerX.equalTo(pictureView.snp.centerX)
            make.centerY.equalTo(pictureView.snp.centerY)
            make.width.height.equalTo(100)
        }
    }
}
