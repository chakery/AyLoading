//
//  macOSIndicatorView.swift
//  Pods
//
//  Created by Talkpal on 2017/9/28.
//
//

import Cocoa

public class IndicatorView: NSView {
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    public var space: CGFloat = 4.0 {
        didSet {
            updateCustomConstraints()
        }
    }
    
    public var padding: NSEdgeInsets = NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) {
        didSet {
            updateCustomConstraints()
        }
    }
    
    public func startAnimating() {
        guard !isLoading else {
            return
        }
        isLoading = true
        activityIndicator.startAnimation(nil)
        let animations: (NSAnimationContext) -> Void = { context in
            context.duration = 0.3
            self.animator().alphaValue = 1
        }
        NSAnimationContext.runAnimationGroup(animations, completionHandler: nil)
    }
    
    public func stopAnimating(completed: AnimatedCompleted?) {
        guard isLoading else { return }
        isLoading = false
        self.ay.removeFromSuperview(animated: true) { [weak self] in
            self?.activityIndicator.stopAnimation(nil)
            completed?()
        }
    }
    
    public var message: String? {
        didSet {
            messageLabel.stringValue = message ?? ""
            updateCustomConstraints()
        }
    }
    
    public private(set) var isLoading: Bool = false
    
    public private(set) lazy var activityIndicator: NSProgressIndicator = {
        let indicator = NSProgressIndicator()
        indicator.style = .spinning
        indicator.controlSize = .small
        indicator.isDisplayedWhenStopped = false
        indicator.stopAnimation(nil)
        indicator.sizeToFit()
        return indicator
    }()
    
    public private(set) lazy var messageLabel: NSTextField = {
        let label = NSTextField()
        label.isEditable = false
        label.isSelectable = false
        label.textColor = .gray
        label.backgroundColor = .controlColor
        label.drawsBackground = false
        label.isBezeled = false
        label.alignment = .natural
        label.font = self.defaultFont
        label.lineBreakMode = .byClipping
        label.cell?.isScrollable = true
        label.cell?.wraps = false
        return label
    }()
    
    private var defaultFont: NSFont {
        return NSFont.systemFont(ofSize: 15.0)
    }
    
    private var labelSize: CGSize {
        if let val = message, !val.isEmpty {
            let str = NSString(string: val)
            var size = str.size(withAttributes: [NSAttributedStringKey.font: messageLabel.font ?? defaultFont])
            size.width += 2
            size.height += 2
            return size
        }
        return .zero
    }
    
    private var customConstraints: [NSLayoutConstraint] = []
    
    private var isHiddenMessageLabel: Bool {
        if let val = message {
            return val.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
        return true
    }
    
    public override var intrinsicContentSize: CGSize {
        let h1 = activityIndicator.bounds.size.height
        let w1 = activityIndicator.bounds.size.width
        
        let h2 = labelSize.height
        let w2 = labelSize.width
        
        let w = w1 + w2 + space + padding.left + padding.right
        let h = max(h1, h2) + padding.top + padding.bottom
        let size = CGSize(width: w, height: h)
        
        return size
    }
    
    private func setupView() {
        setupIndicator()
        setupMessageLabel()
    }
    
    private func setupIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        setupIndicatorConstraints()
    }
    
    private func setupMessageLabel() {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(messageLabel)
        setupMessageLabelConstraints()
    }
    
    private func updateCustomConstraints() {
        invalidateIntrinsicContentSize()
        
        for item in customConstraints {
            removeConstraint(item)
        }
        
        customConstraints.removeAll()
        setupIndicatorConstraints()
        setupMessageLabelConstraints()
    }
    
    private func setupIndicatorConstraints() {
        if isHiddenMessageLabel {
            let centerX = NSLayoutConstraint(item: activityIndicator,
                                             attribute: .centerX,
                                             relatedBy: .equal,
                                             toItem: self,
                                             attribute: .centerX,
                                             multiplier: 1.0,
                                             constant: 0.0)
            let centerY = NSLayoutConstraint(item: activityIndicator,
                                             attribute: .centerY,
                                             relatedBy: .equal,
                                             toItem: self,
                                             attribute: .centerY,
                                             multiplier: 1.0,
                                             constant: 0.0)
            addConstraint(centerX)
            addConstraint(centerY)
            customConstraints.append(centerX)
            customConstraints.append(centerY)
        } else {
            let leading = NSLayoutConstraint(item: activityIndicator,
                                             attribute: .leading,
                                             relatedBy: .equal,
                                             toItem: self,
                                             attribute: .leading,
                                             multiplier: 1.0,
                                             constant: padding.left)
            let centerY = NSLayoutConstraint(item: activityIndicator,
                                             attribute: .centerY,
                                             relatedBy: .equal,
                                             toItem: self,
                                             attribute: .centerY,
                                             multiplier: 1.0,
                                             constant: 0.0)
            addConstraint(leading)
            addConstraint(centerY)
            customConstraints.append(leading)
            customConstraints.append(centerY)
        }
    }
    
    private func setupMessageLabelConstraints() {
        let leading = NSLayoutConstraint(item: messageLabel,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: activityIndicator,
                                         attribute: .trailing,
                                         multiplier: 1.0,
                                         constant: space)
        let height = NSLayoutConstraint(item: messageLabel,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1.0,
                                        constant: labelSize.height)
        let width = NSLayoutConstraint(item: messageLabel,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1.0,
                                       constant: labelSize.width)
        let centerY = NSLayoutConstraint(item: messageLabel,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: 0.0)
        addConstraint(leading)
        addConstraint(height)
        addConstraint(width)
        addConstraint(centerY)
        customConstraints.append(leading)
        customConstraints.append(height)
        customConstraints.append(width)
        customConstraints.append(centerY)
    }
    
}


