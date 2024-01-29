//
//  UIView+Extensions.swift
//  iOS12-HW13-Alexey Cherebayev
//
//  Created by Alex on 29.01.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach({ addSubview($0) })
    }
}
