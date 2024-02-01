//
//  DetailViewController.swift
//  iOS12-HW13-Alexey Cherebayev
//
//  Created by Alex on 29.01.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewTitle: String? = nil
    private var viewImage: UIImage? = nil

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        title = viewTitle
    }
    
    private func setupHierarchy() {
        
    }
    
    static func newInstance(viewTitle: String?, viewImage: UIImage?) -> DetailViewController {
        let bundle = Bundle.init(for: DetailViewController.self)
        let vc = DetailViewController.init(nibName: "DetailViewController", bundle: bundle)
        vc.viewTitle = viewTitle
        vc.viewImage = viewImage
        return vc
    }

}
