//
//  NSView+Animations.swift
//  Pods
//
//  Created by Talkpal on 2017/9/29.
//
//

import Cocoa

public extension AyLoading where Base: NSView {
    
    public func addSubview(_ view: NSView, animated: Bool, completed: AnimatedCompleted? = nil) {
        let originAlpha = view.alphaValue
        view.alphaValue = 0
        base.addSubview(view)
        let animations: (NSAnimationContext) -> Void = { context in
            context.duration = animated ? 0.3 : 0.0
            view.animator().alphaValue = originAlpha
        }
        let completion: () -> Void = {
            completed?()
        }
        NSAnimationContext.runAnimationGroup(animations, completionHandler: completion)
    }
    
    public func removeFromSuperview(animated: Bool, completed: AnimatedCompleted? = nil) {
        let originAlpha = base.alphaValue
        let animations: (NSAnimationContext) -> Void = { [weak base] context in
            context.duration = animated ? 0.3 : 0.0
            base?.animator().alphaValue = 0.0
        }
        let completion: () -> Void = { [weak base] in
            base?.alphaValue = originAlpha
            base?.removeFromSuperview()
            completed?()
        }
        NSAnimationContext.runAnimationGroup(animations, completionHandler: completion)
    }
}
