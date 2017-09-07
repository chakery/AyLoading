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
        sender.ay.startLoading()
        delay(3) { 
            sender.ay.stopLoading()
        }
    }
    @IBAction func squareHandler(_ sender: NSButton) {
        sender.ay.startLoading()
        delay(3) {
            sender.ay.stopLoading()
        }
    }
    @IBAction func roundRectHandler(_ sender: NSButton) {
        sender.ay.startLoading()
        delay(3) {
            sender.ay.stopLoading()
        }
    }
    @IBAction func squareButtonHandler(_ sender: NSButton) {
        view.ay.startLoading()
        sender.ay.startLoading()
        delay(3) {
            self.view.ay.stopLoading()
            sender.ay.stopLoading()
        }
    }
    
    func delay(_ duration: TimeInterval, action: @escaping ()->Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            action()
        }
    }
}

