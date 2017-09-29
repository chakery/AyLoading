//
//  NSView+Indicator.swift
//  talkpal
//
//  Created by Chakery on 2017/9/6.
//  Copyright © 2017年 Chakery. All rights reserved.
//

import Cocoa

private var indicatorViewTempKey: Void?

extension AyLoading where Base: NSView {
    
    private var indicatorViewTemp: IndicatorView? {
        get {
            return objc_getAssociatedObject(base, &indicatorViewTempKey) as? IndicatorView
        }
        set {
            objc_setAssociatedObject(base, &indicatorViewTempKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var indicatorView: IndicatorView {
        if let val = indicatorViewTemp {
            return val
        }
        let indicator = IndicatorView()
        indicatorViewTemp = indicator
        return indicator
    }
    
    @discardableResult
    public func startLoading(message: String? = nil) -> Bool {
        guard !indicatorView.isLoading else {
            return false
        }
        startAnimation(message)
        return true
    }
    
    @discardableResult
    public func stopLoading() -> Bool {
        guard indicatorView.isLoading else {
            return false
        }
        stopAnimation()
        return true
    }
    
    func startAnimation(_ message: String?) {
        setupIndicatorView()
        indicatorView.startAnimating()
        indicatorView.message = message
    }
    
    func stopAnimation(completed: AnimatedCompleted? = nil) {
        indicatorView.stopAnimating(completed: completed)
    }
    
    private func setupIndicatorView() {
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        base.addSubview(indicatorView)
        let centerX = NSLayoutConstraint(item: indicatorView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: base,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0.0)
        let centerY = NSLayoutConstraint(item: indicatorView,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: base,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: 0.0)
        base.addConstraint(centerX)
        base.addConstraint(centerY)
    }
    
}
