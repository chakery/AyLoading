//
//  ViewController.swift
//  ExampleForMacOS
//
//  Created by Chakery on 2017/9/7.
//  Copyright © 2017年 Chakery. All rights reserved.
//

import Cocoa
import AyLoading

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        }
    }

    @IBAction func buttonHandler(_ sender: NSButton) {
        sender.ay.startLoading(message: "Login...")
        delay(3) { 
            sender.ay.stopLoading()
        }
    }
    @IBAction func squareButtonHandler(_ sender: NSButton) {
        sender.ay.startLoading()
        view.ay.startLoading(message: "Loading...")
        delay(3) {
            sender.ay.stopLoading()
            self.view.ay.stopLoading()
        }
    }
    
    func delay(_ duration: TimeInterval, action: @escaping ()->Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            action()
        }
    }
}

