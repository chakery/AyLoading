//
//  AyLoading.swift
//  talkpal
//
//  Created by Chakery on 2017/9/6.
//  Copyright © 2017年 Chakery. All rights reserved.
//

#if os(macOS)
    import AppKit
    typealias View = NSView
#elseif os(iOS)
    import UIKit
    typealias View = UIView
#endif

public typealias AnimatedCompleted = () -> Void

public final class AyLoading<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol AyLoadingCompatible {
    associatedtype CompatibleType
    var ay: CompatibleType { get }
}

public extension AyLoadingCompatible {
    public var ay: AyLoading<Self> {
        get { return AyLoading(self) }
    }
}

public protocol AyLoadingAction {
    func startLoading(message: String?) -> Bool
    func stopLoading() -> Bool
}

public extension AyLoadingAction {
    func startLoading(message: String?) -> Bool {
        return false
    }
    
    func stopLoading() -> Bool {
        return false
    }
}

#if os(macOS) || os(iOS)
    extension View: AyLoadingCompatible, AyLoadingAction { }
#endif

#if os(iOS)
    extension UIBarButtonItem: AyLoadingCompatible, AyLoadingAction { }
#endif
