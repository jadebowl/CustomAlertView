//
//  ViewController.swift
//  UIKitExamples
//
//  Created by Giada Ciotola on 28/09/23.
//

import UIKit
import CustomAlert

class ViewController: UIViewController {

    let alert = AlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AlertWindow.shared.delegate = self
    }

    func setupAlert() {
        AlertWindow.shared.setupContents(accentColor: .systemBlue,
                            backgroundColor: .systemBackground,
                            icon: UIImage(systemName: "hand.wave"),
                            title: "I am a title",
                            message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            agreeTitle: "Go to Settings",
                            cancelTitle: "Cancel",
                            position: .bottom,
                            bottomAnimation: true,
                            hostVC: self)
        AlertWindow.shared.fadeIn(duration: 0.3)
    }

    @IBAction func showAlert(_ sender: UIButton) {
        setupAlert()
    }
}

extension ViewController: AlertWindowDelegate {
    func agreeAction() {
        // MARK: - Example: Go to Settings
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                print("Settings opened: \(success)")
            })
        }
    }
    
    func cancelAction() {
        AlertWindow.shared.removeFromSuperView(duration: 0.3)
    }
}


