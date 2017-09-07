//
//  NSView+Indicator.swift
//  talkpal
//
//  Created by Chakery on 2017/9/6.
//  Copyright © 2017年 Chakery. All rights reserved.
//

import Cocoa

private var isLoadingKey: Void?
private var progressIndicatorTempKey: Void?

extension AyLoading where Base: NSView {
    
    private var progressIndicatorTemp: NSProgressIndicator? {
        get {
            return objc_getAssociatedObject(base, &progressIndicatorTempKey) as? NSProgressIndicator
        }
        set {
            objc_setAssociatedObject(base, &progressIndicatorTempKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public internal(set) var isLoading: Bool {
        get {
            return objc_getAssociatedObject(base, &isLoadingKey) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(base, &isLoadingKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    public var progressIndicator: NSProgressIndicator {
        if let progressIndicatorTemp = progressIndicatorTemp {
            return progressIndicatorTemp
        }
        let indicator = NSProgressIndicator()
        indicator.style = .spinningStyle
        indicator.controlSize = .small
        indicator.isDisplayedWhenStopped = false
        indicator.stopAnimation(nil)
        progressIndicatorTemp = indicator
        return indicator
    }
    
    @discardableResult
    public func startLoading() -> Bool {
        guard !isLoading else {
            return false
        }
        startAnimation()
        return true
    }
    
    @discardableResult
    public func stopLoading() -> Bool {
        guard isLoading else {
            return false
        }
        stopAnimation()
        return true
    }
    
    func startAnimation() {
        setupProgressIndicator()
        progressIndicator.startAnimation(nil)
        isLoading = true
    }
    
    func stopAnimation() {
        progressIndicator.stopAnimation(nil)
        removeProgressIndicator()
        isLoading = false
    }
    
    private func setupProgressIndicator() {
        progressIndicator.translatesAutoresizingMaskIntoConstraints = false
        base.addSubview(progressIndicator)
        let centerX = NSLayoutConstraint(item: progressIndicator,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: base,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0.0)
        let centerY = NSLayoutConstraint(item: progressIndicator,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: base,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: 0.0)
        base.addConstraint(centerX)
        base.addConstraint(centerY)
    }
    
    private func removeProgressIndicator() {
        progressIndicator.removeFromSuperview()
    }
}
