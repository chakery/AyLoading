//
//  UIView+Indicator.swift
//  Pods
//
//  Created by Chakery on 2017/9/7.
//
//

import UIKit

private var isLoadingKey: Void?
private var activityIndicatorTempKey: Void?

extension AyLoading where Base: UIView {
    
    private var activityIndicatorTemp: UIActivityIndicatorView? {
        get {
            return objc_getAssociatedObject(base, &activityIndicatorTempKey) as? UIActivityIndicatorView
        }
        set {
            objc_setAssociatedObject(base, &activityIndicatorTempKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var isLoading: Bool {
        return activityIndicator.isAnimating
    }
    
    public var activityIndicator: UIActivityIndicatorView {
        if let activityIndicatorTemp = activityIndicatorTemp {
            return activityIndicatorTemp
        }
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        indicator.hidesWhenStopped = true
        indicator.stopAnimating()
        activityIndicatorTemp = indicator
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
        setupActivityIndicator()
        activityIndicator.startAnimating()
    }
    
    func stopAnimation() {
        activityIndicator.stopAnimating()
        removeActivityIndicator()
    }
    
    private func setupActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        base.addSubview(activityIndicator)
        let centerX = NSLayoutConstraint(item: activityIndicator,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: base,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0.0)
        let centerY = NSLayoutConstraint(item: activityIndicator,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: base,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: 0.0)
        base.addConstraint(centerX)
        base.addConstraint(centerY)
    }
    
    private func removeActivityIndicator() {
        activityIndicator.removeFromSuperview()
    }
}

