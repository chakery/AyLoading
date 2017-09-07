//
//  ViewController.swift
//  ExampleForiOS
//
//  Created by Chakery on 2017/9/7.
//  Copyright © 2017年 Chakery. All rights reserved.
//

import UIKit
import AyLoading

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let leftBar = UIBarButtonItem(title: "Letf", style: .plain, target: self, action: #selector(barButtonItemHandler(_:)))
        navigationItem.leftBarButtonItem = leftBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonHandler(_ sender: UIButton) {
        sender.ay.startLoading()
        view.ay.activityIndicator.color = UIColor.red
        view.ay.startLoading()
        delay(3) { 
            sender.ay.stopLoading()
            self.view.ay.stopLoading()
        }
    }
    
    @IBAction func rightHandler(_ sender: UIButton) {
        sender.ay.startLoading()
        delay(3) {
            sender.ay.stopLoading()
        }
    }
    
    func barButtonItemHandler(_ sender: UIBarButtonItem) {
        sender.ay.startLoading()
        delay(3) {
            sender.ay.stopLoading()
        }
    }
    
    func delay(_ duration: TimeInterval, action: @escaping ()->Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            action()
        }
    }
}

