//
//  UIBarButtonItem+Loading.swift
//  Pods
//
//  Created by Chakery on 2017/9/7.
//
//

import UIKit

private var UIBarButtonItemSubviewsKey: Void?

extension AyLoading where Base: UIBarButtonItem {
    
    private var subviewsTemp: [UIView] {
        get{
            return objc_getAssociatedObject(base, &UIBarButtonItemSubviewsKey) as? [UIView] ?? []
        }
        set {
            objc_setAssociatedObject(base, &UIBarButtonItemSubviewsKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var indicatorView: IndicatorView? {
        if let view = baseContentView {
            return view.ay.indicatorView
        }
        return nil
    }
    
    @discardableResult
    public func startLoading(message: String? = nil) -> Bool {
        guard let view = baseContentView else {
            return false
        }
        guard !view.ay.isLoading else {
            return false
        }
        prepareStartLoading()
        view.ay.startAnimation(message)
        view.isUserInteractionEnabled = false
        return true
    }
    
    @discardableResult
    public func stopLoading() -> Bool {
        guard let view = baseContentView else {
            return false
        }
        guard view.ay.isLoading else {
            return false
        }
        prepareStopLoading()
        view.ay.stopAnimation {
            view.isUserInteractionEnabled = true
        }
        return true
    }
    
    private func prepareStartLoading() {
        if let view = baseContentView {
            subviewsTemp = view.subviews
            view.subviews.forEach { $0.ay.removeFromSuperview(animated: true) }
        }
    }
    
    private func prepareStopLoading() {
        if let view = baseContentView {
            subviewsTemp.forEach { view.ay.addSubview($0, animated: true) }
        }
    }
    
    private var baseContentView: UIView? {
        return base.value(forKey: "view") as? UIView
    }
}
