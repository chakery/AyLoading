//
//  UIButton+Loading.swift
//  Pods
//
//  Created by Chakery on 2017/9/7.
//
//

import UIKit

extension AyLoading where Base: UIButton {
    
    @discardableResult
    public func startLoading(message: String? = nil) -> Bool {
        guard !base.ay.isLoading else { return false }
        prepareStartLoading()
        base.ay.startAnimation(message)
        base.isUserInteractionEnabled = false
        return true
    }
    
    @discardableResult
    public func stopLoading() -> Bool {
        guard base.ay.isLoading else { return false }
        prepareStopLoading()
        base.ay.stopAnimation { [weak base] in
            base?.isUserInteractionEnabled = true
        }
        return true
    }
    
    private func prepareStartLoading() {
        base.titleLabel?.ay.removeFromSuperview(animated: true)
        base.imageView?.ay.removeFromSuperview(animated: true)
    }
    
    private func prepareStopLoading() {
        if let titleLabel = base.titleLabel {
            base.ay.addSubview(titleLabel, animated: true)
        }
        if let imageView = base.imageView {
            base.ay.addSubview(imageView, animated: true)
        }
    }
}
