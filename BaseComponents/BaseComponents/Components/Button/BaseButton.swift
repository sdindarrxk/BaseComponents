//
//  BaseButton.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class BaseButton: UIButton {
    
    // MARK: - Properties
    var defaultBackgroundColor: UIColor = .green
    var normalTextColor: UIColor = .black
    var highlightedTextColor: UIColor = .white
    var borderColor: UIColor = .black
    var highlightedBorderColor: UIColor = .systemGray
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    init(backgroundColor: UIColor, title: String, normalTextColor: UIColor = .black, highlightedTextColor: UIColor = .white, borderColor: UIColor = .black) {
        super.init(frame: .zero)
        self.defaultBackgroundColor = backgroundColor
        self.normalTextColor = normalTextColor
        self.highlightedTextColor = highlightedTextColor
        self.borderColor = borderColor
        set(backgroundColor: backgroundColor, title: title)
        initialize()
    }
    
    fileprivate func initialize() {
        layer.borderColor = borderColor.cgColor
        setTitleColor(normalTextColor, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .subheadline)
        translatesAutoresizingMaskIntoConstraints = false
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    // MARK: - Configuration Methods
    func set(backgroundColor: UIColor, title: String) {
        self.defaultBackgroundColor = backgroundColor
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
    
    // MARK: - Overriding Methods
    override var isEnabled: Bool {
        didSet {
            updateButtonAppearance()
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            updateButtonAppearance()
        }
    }
    
    // MARK: - Helper Methods
    fileprivate func applyDisabledAppearance() {
        backgroundColor = .systemGray
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .subheadline)
        alpha = 0.7
    }
    
    fileprivate func applySelectedOrHighlightedAppearance() {
        backgroundColor = defaultBackgroundColor.withAlphaComponent(0.9)
        alpha = 1.0
        layer.borderWidth = 1
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    fileprivate func applyNormalAppearance() {
        backgroundColor = defaultBackgroundColor
        alpha = 1.0
        layer.borderWidth = 0
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .subheadline)
    }
    
    fileprivate func updateButtonAppearance() {
        if !isEnabled {
            applyDisabledAppearance()
        } else if isSelected || isHighlighted {
            applySelectedOrHighlightedAppearance()
        } else {
            applyNormalAppearance()
        }
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius = bounds.height / 2
    }
    
    // MARK: - Actions
    @objc func buttonTapped() {
        guard isEnabled else { return }
        
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0.8
        }, completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.alpha = 1
            }
        })
    }
}
