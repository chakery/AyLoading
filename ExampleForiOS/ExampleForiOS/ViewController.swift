//
//  ViewController.swift
//  ExampleForiOS
//
//  Created by Chakery on 2017/9/7.
//  Copyright © 2017年 Chakery. All rights reserved.

import UIKit
import AyLoading

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftBar = UIBarButtonItem(title: "Letf", style: .plain, target: self, action: #selector(barButtonItemHandler(_:)))
        navigationItem.leftBarButtonItem = leftBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func buttonHandler(_ sender: UIButton) {
        sender.ay.startLoading(message: "btttttn...")
        delay(3) {
            sender.ay.stopLoading()
        }
    }
    
    @IBAction func rightHandler(_ sender: UIButton) {
        sender.ay.startLoading(message: "righttttt")
        delay(3) {
            sender.ay.stopLoading()
        }
    }
    
    @objc func barButtonItemHandler(_ sender: UIBarButtonItem) {
        sender.ay.startLoading()
        delay(3) {
            sender.ay.stopLoading()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.ay.startLoading(message: "Loading...")
        delay(3) {
            self.view.ay.stopLoading()
        }
    }
    
    func delay(_ duration: TimeInterval, action: @escaping ()->Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            action()
        }
    }
}

