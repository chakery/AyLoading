//
//  ViewController.swift
//  iOS
//
//  Created by Chakery on 2018/12/1.
//

import UIKit
import AyLoading

class ViewController: UIViewController {
    let sysBlue = UIColor(displayP3Red: 22 / 255.0, green: 118 / 255.0, blue: 255 / 255.0, alpha: 1)

    func delay(_ duration: TimeInterval = 3, action: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            action()
        }
    }

    @IBAction func refreshAction(_ sender: UIBarButtonItem) {
        sender.ay.indicatorView?.activityIndicator.color = sysBlue
        sender.ay.startLoading()
        delay {
            sender.ay.stopLoading()
        }
    }

    @IBAction func sendAction(_ sender: UIButton) {
        sender.ay.indicatorView.messageLabel.font = UIFont.systemFont(ofSize: 11)
        sender.ay.indicatorView.activityIndicator.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        sender.ay.startLoading(message: "Sending...")
        delay {
            sender.ay.stopLoading()
        }
    }

    @IBAction func loadAction(_ sender: UIButton) {
        sender.ay.indicatorView.messageLabel.textColor = .white
        sender.ay.indicatorView.activityIndicator.style = .white
        sender.ay.startLoading(message: "loading...")
        delay {
            sender.ay.stopLoading()
        }
    }

    @IBAction func loginAction(_ sender: UIButton) {
        sender.ay.indicatorView.messageLabel.textColor = .white
        sender.ay.indicatorView.activityIndicator.style = .whiteLarge
        sender.ay.indicatorView.messageLabel.font = UIFont.systemFont(ofSize: 30)
        sender.ay.startLoading(message: "Logining...")
        delay {
            sender.ay.stopLoading()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.ay.startLoading(message: "Loading...")
        delay {
            self.view.ay.stopLoading()
        }
    }
}
