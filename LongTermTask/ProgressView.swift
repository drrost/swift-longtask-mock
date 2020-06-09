//
//  ProgressView.swift
//  LongTermTask
//
//  Created by Rostyslav Druzhchenko on 09.06.2020.
//  Copyright © 2020 Rostyslav Druzhchenko. All rights reserved.
//

import UIKit

class ProgressView: UIView {

    @IBOutlet weak var progressBarContainerView: UIView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!

    var progress: Double = 0.0 {
        didSet {
            updateUi()
        }
    }

    override func awakeFromNib() {
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
        progress = 0.0
    }

    private func updateUi() {
        let width = progressBarContainerView.frame.size.width
        widthConstraint.constant = width * CGFloat(progress)
    }

    override func layoutSubviews() {
        updateUi()
    }
}
