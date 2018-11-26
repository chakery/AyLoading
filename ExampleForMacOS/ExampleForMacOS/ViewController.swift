//
//  ViewController.swift
//  ExampleFormacOS
//
//  Created by Chakery on 2018/11/26.
//  Copyright © 2018 Chakery. All rights reserved.
//

import Cocoa
import AyLoading

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
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

