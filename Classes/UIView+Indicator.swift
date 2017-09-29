//
//  UIView+Indicator.swift
//  Pods
//
//  Created by Chakery on 2017/9/7.
//
//

import UIKit

private var indicatorViewTempKey: Void?

extension AyLoading where Base: UIView {
    
    private var indicatorViewTemp: IndicatorView? {
        get {
            return objc_getAssociatedObject(base, &indicatorViewTempKey) as? IndicatorView
        }
        set {
            objc_setAssociatedObject(base, &indicatorViewTempKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var isLoading: Bool {
        return indicatorView.isLoading
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
        guard !isLoading else {
            return false
        }
        startAnimation(message)
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
    
    func startAnimation(_ message: String?) {
        setupActivityIndicator()
        indicatorView.message = message
        indicatorView.startAnimating()
    }
    
    func stopAnimation(completed: AnimatedCompleted? = nil) {
        indicatorView.stopAnimating(completed: completed)
    }
    
    private func setupActivityIndicator() {
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

