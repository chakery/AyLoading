//
//  NSButton+Loading.swift
//  talkpal
//
//  Created by Chakery on 2017/9/6.
//  Copyright © 2017年 Chakery. All rights reserved.
//

import Cocoa

private var subViewsTempKey: Void?

extension AyLoading where Base: NSButton {
    
    private var subViewsTemp: [NSView] {
        get {
            return objc_getAssociatedObject(base, &subViewsTempKey) as? [NSView] ?? []
        }
        set {
            objc_setAssociatedObject(base, &subViewsTempKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @discardableResult
    public func startLoading() -> Bool {
        guard !base.ay.isLoading else { return false }
        prepareStartLoading()
        base.ay.startAnimation()
        base.isEnabled = false
        return true
    }
    
    @discardableResult
    public func stopLoading() -> Bool {
        guard base.ay.isLoading else { return false }
        prepareStopLoading()
        base.ay.stopAnimation()
        base.isEnabled = true
        return true
    }
    
    private func prepareStartLoading() {
        subViewsTemp = base.subviews
        NSAnimationContext.runAnimationGroup({ (context) in
            context.duration = 0.3
            base.subviews.forEach { $0.animator().removeFromSuperview() }
        }, completionHandler: nil)
    }
    
    private func prepareStopLoading() {
        NSAnimationContext.runAnimationGroup({ (context) in
            subViewsTemp.forEach { base.animator().addSubview($0) }
        }, completionHandler: nil)
    }
}
