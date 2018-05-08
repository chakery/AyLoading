//
//  IndicatorView.swift
//  Pods
//
//  Created by Talkpal on 2017/9/28.
//
//

import UIKit

public class IndicatorView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    public var space: CGFloat = 4.0 {
        didSet {
            updateCustomConstraints()
        }
    }
    
    public var padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) {
        didSet {
            updateCustomConstraints()
        }
    }
    
    public var isLoading: Bool {
        return activityIndicator.isAnimating
    }
    
    public func startAnimating() {
        guard !isLoading else { return }
        activityIndicator.startAnimating()
        let animations = {
            self.alpha = 1
        }
        UIView.animate(withDuration: 0.3, animations: animations)
    }
    
    public func stopAnimating(completed: AnimatedCompleted?) {
        guard isLoading else { return }
        self.ay.removeFromSuperview(animated: true) { [weak self] in
            self?.activityIndicator.stopAnimating()
            completed?()
        }
    }
    
    public var message: String? {
        didSet {
            messageLabel.text = message
            updateCustomConstraints()
        }
    }
    
    public private(set) lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        indicator.hidesWhenStopped = true
        indicator.stopAnimating()
        return indicator
    }()
    
    public private(set) lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        return label
    }()
    
    private var labelSize: CGSize {
        if let val = message, !val.isEmpty {
            let str = NSString(string: val)
            var size = str.size(withAttributes: [NSAttributedStringKey.font: messageLabel.font])
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


