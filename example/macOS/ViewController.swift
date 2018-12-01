//
//  ViewController.swift
//  macOS
//
//  Created by Chakery on 2018/12/1.
//

import Cocoa
import AyLoading

class ViewController: NSViewController {

    func delay(_ duration: TimeInterval = 3, action: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            action()
        }
    }

    @IBAction func pushAction(_ sender: NSButton) {
        sender.ay.startLoading()
        delay {
            sender.ay.stopLoading()
        }
    }

    @IBAction func texturedAction(_ sender: NSButton) {
        sender.ay.startLoading(message: "loading...")
        delay {
            sender.ay.stopLoading()
        }
    }

    @IBAction func roundAction(_ sender: NSButton) {
        sender.ay.startLoading()
        delay {
            sender.ay.stopLoading()
        }
    }
}
