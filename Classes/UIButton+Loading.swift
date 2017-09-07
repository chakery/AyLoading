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
    public func startLoading() -> Bool {
        guard !base.ay.isLoading else { return false }
        prepareStartLoading()
        base.ay.startAnimation()
        base.isUserInteractionEnabled = false
        return true
    }
    
    @discardableResult
    public func stopLoading() -> Bool {
        guard base.ay.isLoading else { return false }
        prepareStopLoading()
        base.ay.stopAnimation()
        base.isUserInteractionEnabled = true
        return true
    }
    
    private func prepareStartLoading() {
        base.titleLabel?.removeFromSuperview()
        base.imageView?.removeFromSuperview()
    }
    
    private func prepareStopLoading() {
        if let titleLabel = base.titleLabel {
            base.addSubview(titleLabel)
        }
        if let imageView = base.imageView {
            base.addSubview(imageView)
        }
    }
}
