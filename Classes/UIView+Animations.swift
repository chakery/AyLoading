//
//  UIView+ Animations.swift
//  Pods
//
//  Created by Talkpal on 2017/9/29.
//
//

import UIKit

public extension AyLoading where Base: UIView {
    
    public func addSubview(_ view: UIView, animated: Bool, completed: AnimatedCompleted? = nil) {
        let originAlpha = view.alpha
        view.alpha = 0
        base.addSubview(view)
        let animations: () -> Void = {
            view.alpha = originAlpha
        }
        let completion: (Bool) -> Void = { _ in
            completed?()
        }
        UIView.animate(withDuration: animated ? 0.3 : 0.0, animations: animations, completion: completion)
    }
    
    public func removeFromSuperview(animated: Bool, completed: AnimatedCompleted? = nil) {
        let animations: () -> Void = { [weak base] in
            base?.alpha = 0
        }
        let completion: (Bool) -> Void = { [weak base] _ in
            base?.alpha = 1.0
            base?.removeFromSuperview()
            completed?()
        }
        UIView.animate(withDuration: animated ? 0.3 : 0.0, animations: animations, completion: completion)
    }
}
