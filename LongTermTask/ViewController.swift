//
//  ViewController.swift
//  LongTermTask
//
//  Created by Rostyslav Druzhchenko on 09.06.2020.
//  Copyright © 2020 Rostyslav Druzhchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var networking: Networking!

    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var progressView: ProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()

        networking = Networking()
    }

    // MARK: - Actions

    @IBAction func download(_ sender: Any) {

        downloadButton.isEnabled = false

        networking.downloadAsset({ progress in
            self.progressView.progress = progress
            print("Downloaded: \(progress * 100)%")
        }) { _ in
            self.downloadButton.isEnabled = true
            print("Downloaded")
        }
    }

}
